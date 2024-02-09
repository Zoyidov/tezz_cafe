import 'package:freezed_annotation/freezed_annotation.dart';

part 'waitress_model.freezed.dart';

part 'waitress_model.g.dart';

@freezed
class WaitressModel with _$WaitressModel {
  const factory WaitressModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "user") required String user,
    @JsonKey(name: "contact_number") required String contactNumber,
    @JsonKey(name: "employee_id") required String employeeId,
    @JsonKey(name: "cafe") required int cafe,
  }) = _WaitressModel;

  factory WaitressModel.fromJson(Map<String, dynamic> json) => _$WaitressModelFromJson(json);
}

