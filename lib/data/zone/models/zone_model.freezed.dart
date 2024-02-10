// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZoneModel _$ZoneModelFromJson(Map<String, dynamic> json) {
  return _ZoneModel.fromJson(json);
}

/// @nodoc
mixin _$ZoneModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "cafe")
  int get cafe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneModelCopyWith<ZoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneModelCopyWith<$Res> {
  factory $ZoneModelCopyWith(ZoneModel value, $Res Function(ZoneModel) then) =
      _$ZoneModelCopyWithImpl<$Res, ZoneModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "cafe") int cafe});
}

/// @nodoc
class _$ZoneModelCopyWithImpl<$Res, $Val extends ZoneModel>
    implements $ZoneModelCopyWith<$Res> {
  _$ZoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cafe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZoneModelImplCopyWith<$Res>
    implements $ZoneModelCopyWith<$Res> {
  factory _$$ZoneModelImplCopyWith(
          _$ZoneModelImpl value, $Res Function(_$ZoneModelImpl) then) =
      __$$ZoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "cafe") int cafe});
}

/// @nodoc
class __$$ZoneModelImplCopyWithImpl<$Res>
    extends _$ZoneModelCopyWithImpl<$Res, _$ZoneModelImpl>
    implements _$$ZoneModelImplCopyWith<$Res> {
  __$$ZoneModelImplCopyWithImpl(
      _$ZoneModelImpl _value, $Res Function(_$ZoneModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cafe = null,
  }) {
    return _then(_$ZoneModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$ZoneModelImpl implements _ZoneModel {
  const _$ZoneModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "cafe") required this.cafe});

  factory _$ZoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "cafe")
  final int cafe;

  @override
  String toString() {
    return 'ZoneModel(id: $id, name: $name, cafe: $cafe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cafe, cafe) || other.cafe == cafe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, cafe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
      __$$ZoneModelImplCopyWithImpl<_$ZoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneModelImplToJson(
      this,
    );
  }
}

abstract class _ZoneModel implements ZoneModel {
  const factory _ZoneModel(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "cafe") required final int cafe}) = _$ZoneModelImpl;

  factory _ZoneModel.fromJson(Map<String, dynamic> json) =
      _$ZoneModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "cafe")
  int get cafe;
  @override
  @JsonKey(ignore: true)
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
