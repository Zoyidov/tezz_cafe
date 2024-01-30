part of 'auth_bloc.dart';

class AuthState {
  final FormzSubmissionStatus status;
  final String? token;
  final String error;
  final bool isVisible;

  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.token,
    this.error = '',
    this.isVisible = true,
  });

  AuthState copyWith({
    FormzSubmissionStatus? status,
    String? token,
    String? error,
    bool? isVisible,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
