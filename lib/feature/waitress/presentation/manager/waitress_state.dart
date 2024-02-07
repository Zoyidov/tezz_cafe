part of 'waitress_bloc.dart';

class WaitressState {
  final FormzSubmissionStatus status;
  final WaitressModel? waitress;
  final Failure? failure;

  const WaitressState({
    this.status = FormzSubmissionStatus.initial,
    this.waitress,
    this.failure,
  });

  WaitressState copyWith({
    FormzSubmissionStatus? status,
    WaitressModel? waitress,
    Failure? failure,
  }) {
    return WaitressState(
      status: status ?? this.status,
      waitress: waitress ?? this.waitress,
      failure: failure ?? this.failure,
    );
  }
}
