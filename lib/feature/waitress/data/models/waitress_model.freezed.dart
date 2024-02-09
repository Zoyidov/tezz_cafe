// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waitress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WaitressModel _$WaitressModelFromJson(Map<String, dynamic> json) {
  return _WaitressModel.fromJson(json);
}

/// @nodoc
mixin _$WaitressModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_number")
  String get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "employee_id")
  String get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: "cafe")
  int get cafe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaitressModelCopyWith<WaitressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitressModelCopyWith<$Res> {
  factory $WaitressModelCopyWith(
          WaitressModel value, $Res Function(WaitressModel) then) =
      _$WaitressModelCopyWithImpl<$Res, WaitressModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user") String user,
      @JsonKey(name: "contact_number") String contactNumber,
      @JsonKey(name: "employee_id") String employeeId,
      @JsonKey(name: "cafe") int cafe});
}

/// @nodoc
class _$WaitressModelCopyWithImpl<$Res, $Val extends WaitressModel>
    implements $WaitressModelCopyWith<$Res> {
  _$WaitressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? contactNumber = null,
    Object? employeeId = null,
    Object? cafe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaitressModelImplCopyWith<$Res>
    implements $WaitressModelCopyWith<$Res> {
  factory _$$WaitressModelImplCopyWith(
          _$WaitressModelImpl value, $Res Function(_$WaitressModelImpl) then) =
      __$$WaitressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user") String user,
      @JsonKey(name: "contact_number") String contactNumber,
      @JsonKey(name: "employee_id") String employeeId,
      @JsonKey(name: "cafe") int cafe});
}

/// @nodoc
class __$$WaitressModelImplCopyWithImpl<$Res>
    extends _$WaitressModelCopyWithImpl<$Res, _$WaitressModelImpl>
    implements _$$WaitressModelImplCopyWith<$Res> {
  __$$WaitressModelImplCopyWithImpl(
      _$WaitressModelImpl _value, $Res Function(_$WaitressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? contactNumber = null,
    Object? employeeId = null,
    Object? cafe = null,
  }) {
    return _then(_$WaitressModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaitressModelImpl implements _WaitressModel {
  const _$WaitressModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "user") required this.user,
      @JsonKey(name: "contact_number") required this.contactNumber,
      @JsonKey(name: "employee_id") required this.employeeId,
      @JsonKey(name: "cafe") required this.cafe});

  factory _$WaitressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaitressModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "user")
  final String user;
  @override
  @JsonKey(name: "contact_number")
  final String contactNumber;
  @override
  @JsonKey(name: "employee_id")
  final String employeeId;
  @override
  @JsonKey(name: "cafe")
  final int cafe;

  @override
  String toString() {
    return 'WaitressModel(id: $id, user: $user, contactNumber: $contactNumber, employeeId: $employeeId, cafe: $cafe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.cafe, cafe) || other.cafe == cafe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, contactNumber, employeeId, cafe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitressModelImplCopyWith<_$WaitressModelImpl> get copyWith =>
      __$$WaitressModelImplCopyWithImpl<_$WaitressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaitressModelImplToJson(
      this,
    );
  }
}

abstract class _WaitressModel implements WaitressModel {
  const factory _WaitressModel(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "user") required final String user,
      @JsonKey(name: "contact_number") required final String contactNumber,
      @JsonKey(name: "employee_id") required final String employeeId,
      @JsonKey(name: "cafe") required final int cafe}) = _$WaitressModelImpl;

  factory _WaitressModel.fromJson(Map<String, dynamic> json) =
      _$WaitressModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "user")
  String get user;
  @override
  @JsonKey(name: "contact_number")
  String get contactNumber;
  @override
  @JsonKey(name: "employee_id")
  String get employeeId;
  @override
  @JsonKey(name: "cafe")
  int get cafe;
  @override
  @JsonKey(ignore: true)
  _$$WaitressModelImplCopyWith<_$WaitressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
