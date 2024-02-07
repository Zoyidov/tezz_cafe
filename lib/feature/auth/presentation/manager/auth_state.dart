part of 'auth_bloc.dart';

class AuthState {
  final FormzSubmissionStatus status;
  final String? token;
  final String error;
  final bool isVisible;
final bool isChecked;
  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.token,
    this.error = '',
    this.isVisible = true,
    this.isChecked = false,
  });

  AuthState copyWith({
    FormzSubmissionStatus? status,
    String? token,
    String? error,
    bool? isVisible,
    bool? isChecked,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
