part of 'table_bloc.dart';

class TableState {
  FormzSubmissionStatus status;
  List<TableModel> table;
  String message;

  TableState({
    this.status = FormzSubmissionStatus.initial,
    this.table = const [],
    this.message = '',
  });

  TableState copyWith({
    FormzSubmissionStatus? status,
    List<TableModel>? table,
    String? message,
  }) {
    return TableState(
      status: status ?? this.status,
      table: table ?? this.table,
      message: message ?? this.message,
    );
  }
}
