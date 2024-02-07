import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/app.dart';
import 'package:tezz_cafe/core/utils/device/device_utility.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/auth/domain/use_cases/login_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variables
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthBloc(this.loginUseCase) : super(const AuthState()) {
    on<AuthInitial>(_onAuthInitial);
    on<AuthLoginEvent>(_onLogin);
    on<ChangePasswordEvent>(_onChangePassword);
    on<ChangeCheckedEvent>(_onChangeChecked);
  }

  void _onAuthInitial(AuthInitial event, Emitter<AuthState> emit) async {
    final remember = StorageRepository.getBool(StorageKeys.rememberMe);
    if (remember) {
      final username = StorageRepository.getString(StorageKeys.rememberUsername);
      final password = StorageRepository.getString(StorageKeys.rememberPassword);
      usernameController.text = username;
      passwordController.text = password;
      emit(state.copyWith(isChecked: remember, status: FormzSubmissionStatus.initial));
    }
  }

  void _onChangeChecked(ChangeCheckedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked, status: FormzSubmissionStatus.initial));
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    TDeviceUtils.hideKeyboard(navigatorKey.currentContext!);

    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    if (state.isChecked) {
      await StorageRepository.putBool(StorageKeys.rememberMe, state.isChecked);
      await StorageRepository.putString(StorageKeys.rememberUsername, usernameController.text.trim());
      await StorageRepository.putString(StorageKeys.rememberPassword, passwordController.text.trim());
    } else {
      StorageRepository.deleteBool(StorageKeys.rememberMe);
    }

    final result =
        await loginUseCase.execute(LoginParams(username: usernameController.text, password: passwordController.text));
    result.fold(
      (failure) async {
        emit(state.copyWith(status: FormzSubmissionStatus.failure, error: failure.message));
      },
      (token) async {
        print("${token}token");
        emit(state.copyWith(status: FormzSubmissionStatus.success, token: token));
        await StorageRepository.putString(StorageKeys.token, token);
        await StorageRepository.putBool(StorageKeys.isAuth, true);
        print(StorageRepository.getBool(StorageKeys.isAuth));
        print(StorageRepository.getString(StorageKeys.cafeId));

      },
    );
  }

  void _onChangePassword(ChangePasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
