import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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
    on<AuthLoginEvent>(_onLogin);
    on<ChangePasswordEvent>(_onChangePassword);
  }

  void _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    // TODO: Add validation
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    // TODO: Add loading
    // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    // TODO: Remove this after testing
    emit(state.copyWith(status: FormzSubmissionStatus.success));

    // final result =
    //     await loginUseCase.execute(LoginParams(username: usernameController.text, password: passwordController.text));
    // result.fold(
    //   (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, error: failure.message)),
    //   (token) {
    //     StorageRepository.putString(StorageKeys.token, token);
    //     emit(state.copyWith(status: FormzSubmissionStatus.success, token: token));
    //   },
    // );
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
