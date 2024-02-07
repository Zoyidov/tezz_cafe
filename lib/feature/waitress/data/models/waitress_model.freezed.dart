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
  @JsonKey(name: "attachedStol")
  List<ActiveStol> get attachedStol => throw _privateConstructorUsedError;
  @JsonKey(name: "activeStol")
  List<ActiveStol> get activeStol => throw _privateConstructorUsedError;
  @JsonKey(name: "allStol")
  List<ActiveStol> get allStol => throw _privateConstructorUsedError;
  @JsonKey(name: "noActive")
  List<ActiveStol> get noActive => throw _privateConstructorUsedError;
  @JsonKey(name: "ofisiant")
  Ofisiant get ofisiant => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "attachedStol") List<ActiveStol> attachedStol,
      @JsonKey(name: "activeStol") List<ActiveStol> activeStol,
      @JsonKey(name: "allStol") List<ActiveStol> allStol,
      @JsonKey(name: "noActive") List<ActiveStol> noActive,
      @JsonKey(name: "ofisiant") Ofisiant ofisiant});

  $OfisiantCopyWith<$Res> get ofisiant;
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
    Object? attachedStol = null,
    Object? activeStol = null,
    Object? allStol = null,
    Object? noActive = null,
    Object? ofisiant = null,
  }) {
    return _then(_value.copyWith(
      attachedStol: null == attachedStol
          ? _value.attachedStol
          : attachedStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      activeStol: null == activeStol
          ? _value.activeStol
          : activeStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      allStol: null == allStol
          ? _value.allStol
          : allStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      noActive: null == noActive
          ? _value.noActive
          : noActive // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      ofisiant: null == ofisiant
          ? _value.ofisiant
          : ofisiant // ignore: cast_nullable_to_non_nullable
              as Ofisiant,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfisiantCopyWith<$Res> get ofisiant {
    return $OfisiantCopyWith<$Res>(_value.ofisiant, (value) {
      return _then(_value.copyWith(ofisiant: value) as $Val);
    });
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
      {@JsonKey(name: "attachedStol") List<ActiveStol> attachedStol,
      @JsonKey(name: "activeStol") List<ActiveStol> activeStol,
      @JsonKey(name: "allStol") List<ActiveStol> allStol,
      @JsonKey(name: "noActive") List<ActiveStol> noActive,
      @JsonKey(name: "ofisiant") Ofisiant ofisiant});

  @override
  $OfisiantCopyWith<$Res> get ofisiant;
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
    Object? attachedStol = null,
    Object? activeStol = null,
    Object? allStol = null,
    Object? noActive = null,
    Object? ofisiant = null,
  }) {
    return _then(_$WaitressModelImpl(
      attachedStol: null == attachedStol
          ? _value._attachedStol
          : attachedStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      activeStol: null == activeStol
          ? _value._activeStol
          : activeStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      allStol: null == allStol
          ? _value._allStol
          : allStol // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      noActive: null == noActive
          ? _value._noActive
          : noActive // ignore: cast_nullable_to_non_nullable
              as List<ActiveStol>,
      ofisiant: null == ofisiant
          ? _value.ofisiant
          : ofisiant // ignore: cast_nullable_to_non_nullable
              as Ofisiant,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaitressModelImpl implements _WaitressModel {
  const _$WaitressModelImpl(
      {@JsonKey(name: "attachedStol")
      required final List<ActiveStol> attachedStol,
      @JsonKey(name: "activeStol") required final List<ActiveStol> activeStol,
      @JsonKey(name: "allStol") required final List<ActiveStol> allStol,
      @JsonKey(name: "noActive") required final List<ActiveStol> noActive,
      @JsonKey(name: "ofisiant") required this.ofisiant})
      : _attachedStol = attachedStol,
        _activeStol = activeStol,
        _allStol = allStol,
        _noActive = noActive;

  factory _$WaitressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaitressModelImplFromJson(json);

  final List<ActiveStol> _attachedStol;
  @override
  @JsonKey(name: "attachedStol")
  List<ActiveStol> get attachedStol {
    if (_attachedStol is EqualUnmodifiableListView) return _attachedStol;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachedStol);
  }

  final List<ActiveStol> _activeStol;
  @override
  @JsonKey(name: "activeStol")
  List<ActiveStol> get activeStol {
    if (_activeStol is EqualUnmodifiableListView) return _activeStol;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeStol);
  }

  final List<ActiveStol> _allStol;
  @override
  @JsonKey(name: "allStol")
  List<ActiveStol> get allStol {
    if (_allStol is EqualUnmodifiableListView) return _allStol;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allStol);
  }

  final List<ActiveStol> _noActive;
  @override
  @JsonKey(name: "noActive")
  List<ActiveStol> get noActive {
    if (_noActive is EqualUnmodifiableListView) return _noActive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noActive);
  }

  @override
  @JsonKey(name: "ofisiant")
  final Ofisiant ofisiant;

  @override
  String toString() {
    return 'WaitressModel(attachedStol: $attachedStol, activeStol: $activeStol, allStol: $allStol, noActive: $noActive, ofisiant: $ofisiant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitressModelImpl &&
            const DeepCollectionEquality()
                .equals(other._attachedStol, _attachedStol) &&
            const DeepCollectionEquality()
                .equals(other._activeStol, _activeStol) &&
            const DeepCollectionEquality().equals(other._allStol, _allStol) &&
            const DeepCollectionEquality().equals(other._noActive, _noActive) &&
            (identical(other.ofisiant, ofisiant) ||
                other.ofisiant == ofisiant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attachedStol),
      const DeepCollectionEquality().hash(_activeStol),
      const DeepCollectionEquality().hash(_allStol),
      const DeepCollectionEquality().hash(_noActive),
      ofisiant);

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
      {@JsonKey(name: "attachedStol")
      required final List<ActiveStol> attachedStol,
      @JsonKey(name: "activeStol") required final List<ActiveStol> activeStol,
      @JsonKey(name: "allStol") required final List<ActiveStol> allStol,
      @JsonKey(name: "noActive") required final List<ActiveStol> noActive,
      @JsonKey(name: "ofisiant")
      required final Ofisiant ofisiant}) = _$WaitressModelImpl;

  factory _WaitressModel.fromJson(Map<String, dynamic> json) =
      _$WaitressModelImpl.fromJson;

  @override
  @JsonKey(name: "attachedStol")
  List<ActiveStol> get attachedStol;
  @override
  @JsonKey(name: "activeStol")
  List<ActiveStol> get activeStol;
  @override
  @JsonKey(name: "allStol")
  List<ActiveStol> get allStol;
  @override
  @JsonKey(name: "noActive")
  List<ActiveStol> get noActive;
  @override
  @JsonKey(name: "ofisiant")
  Ofisiant get ofisiant;
  @override
  @JsonKey(ignore: true)
  _$$WaitressModelImplCopyWith<_$WaitressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActiveStol _$ActiveStolFromJson(Map<String, dynamic> json) {
  return _ActiveStol.fromJson(json);
}

/// @nodoc
mixin _$ActiveStol {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "stol_nomi")
  String get stolNomi => throw _privateConstructorUsedError;
  @JsonKey(name: "QR")
  String get qr => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: "kafe_id")
  String get kafeId => throw _privateConstructorUsedError;
  @JsonKey(name: "zone_id")
  String get zoneId => throw _privateConstructorUsedError;
  @JsonKey(name: "ofisiant_id")
  String? get ofisiantId => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "xizmat_id")
  String? get xizmatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveStolCopyWith<ActiveStol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveStolCopyWith<$Res> {
  factory $ActiveStolCopyWith(
          ActiveStol value, $Res Function(ActiveStol) then) =
      _$ActiveStolCopyWithImpl<$Res, ActiveStol>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "stol_nomi") String stolNomi,
      @JsonKey(name: "QR") String qr,
      @JsonKey(name: "active") bool active,
      @JsonKey(name: "kafe_id") String kafeId,
      @JsonKey(name: "zone_id") String zoneId,
      @JsonKey(name: "ofisiant_id") String? ofisiantId,
      @JsonKey(name: "code") int? code,
      @JsonKey(name: "xizmat_id") String? xizmatId});
}

/// @nodoc
class _$ActiveStolCopyWithImpl<$Res, $Val extends ActiveStol>
    implements $ActiveStolCopyWith<$Res> {
  _$ActiveStolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stolNomi = null,
    Object? qr = null,
    Object? active = null,
    Object? kafeId = null,
    Object? zoneId = null,
    Object? ofisiantId = freezed,
    Object? code = freezed,
    Object? xizmatId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stolNomi: null == stolNomi
          ? _value.stolNomi
          : stolNomi // ignore: cast_nullable_to_non_nullable
              as String,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      kafeId: null == kafeId
          ? _value.kafeId
          : kafeId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      ofisiantId: freezed == ofisiantId
          ? _value.ofisiantId
          : ofisiantId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      xizmatId: freezed == xizmatId
          ? _value.xizmatId
          : xizmatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveStolImplCopyWith<$Res>
    implements $ActiveStolCopyWith<$Res> {
  factory _$$ActiveStolImplCopyWith(
          _$ActiveStolImpl value, $Res Function(_$ActiveStolImpl) then) =
      __$$ActiveStolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "stol_nomi") String stolNomi,
      @JsonKey(name: "QR") String qr,
      @JsonKey(name: "active") bool active,
      @JsonKey(name: "kafe_id") String kafeId,
      @JsonKey(name: "zone_id") String zoneId,
      @JsonKey(name: "ofisiant_id") String? ofisiantId,
      @JsonKey(name: "code") int? code,
      @JsonKey(name: "xizmat_id") String? xizmatId});
}

/// @nodoc
class __$$ActiveStolImplCopyWithImpl<$Res>
    extends _$ActiveStolCopyWithImpl<$Res, _$ActiveStolImpl>
    implements _$$ActiveStolImplCopyWith<$Res> {
  __$$ActiveStolImplCopyWithImpl(
      _$ActiveStolImpl _value, $Res Function(_$ActiveStolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stolNomi = null,
    Object? qr = null,
    Object? active = null,
    Object? kafeId = null,
    Object? zoneId = null,
    Object? ofisiantId = freezed,
    Object? code = freezed,
    Object? xizmatId = freezed,
  }) {
    return _then(_$ActiveStolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stolNomi: null == stolNomi
          ? _value.stolNomi
          : stolNomi // ignore: cast_nullable_to_non_nullable
              as String,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      kafeId: null == kafeId
          ? _value.kafeId
          : kafeId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      ofisiantId: freezed == ofisiantId
          ? _value.ofisiantId
          : ofisiantId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      xizmatId: freezed == xizmatId
          ? _value.xizmatId
          : xizmatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveStolImpl implements _ActiveStol {
  const _$ActiveStolImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "stol_nomi") required this.stolNomi,
      @JsonKey(name: "QR") required this.qr,
      @JsonKey(name: "active") required this.active,
      @JsonKey(name: "kafe_id") required this.kafeId,
      @JsonKey(name: "zone_id") required this.zoneId,
      @JsonKey(name: "ofisiant_id") this.ofisiantId,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "xizmat_id") this.xizmatId});

  factory _$ActiveStolImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveStolImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "stol_nomi")
  final String stolNomi;
  @override
  @JsonKey(name: "QR")
  final String qr;
  @override
  @JsonKey(name: "active")
  final bool active;
  @override
  @JsonKey(name: "kafe_id")
  final String kafeId;
  @override
  @JsonKey(name: "zone_id")
  final String zoneId;
  @override
  @JsonKey(name: "ofisiant_id")
  final String? ofisiantId;
  @override
  @JsonKey(name: "code")
  final int? code;
  @override
  @JsonKey(name: "xizmat_id")
  final String? xizmatId;

  @override
  String toString() {
    return 'ActiveStol(id: $id, stolNomi: $stolNomi, qr: $qr, active: $active, kafeId: $kafeId, zoneId: $zoneId, ofisiantId: $ofisiantId, code: $code, xizmatId: $xizmatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveStolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stolNomi, stolNomi) ||
                other.stolNomi == stolNomi) &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.kafeId, kafeId) || other.kafeId == kafeId) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.ofisiantId, ofisiantId) ||
                other.ofisiantId == ofisiantId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.xizmatId, xizmatId) ||
                other.xizmatId == xizmatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stolNomi, qr, active, kafeId,
      zoneId, ofisiantId, code, xizmatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveStolImplCopyWith<_$ActiveStolImpl> get copyWith =>
      __$$ActiveStolImplCopyWithImpl<_$ActiveStolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveStolImplToJson(
      this,
    );
  }
}

abstract class _ActiveStol implements ActiveStol {
  const factory _ActiveStol(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "stol_nomi") required final String stolNomi,
      @JsonKey(name: "QR") required final String qr,
      @JsonKey(name: "active") required final bool active,
      @JsonKey(name: "kafe_id") required final String kafeId,
      @JsonKey(name: "zone_id") required final String zoneId,
      @JsonKey(name: "ofisiant_id") final String? ofisiantId,
      @JsonKey(name: "code") final int? code,
      @JsonKey(name: "xizmat_id") final String? xizmatId}) = _$ActiveStolImpl;

  factory _ActiveStol.fromJson(Map<String, dynamic> json) =
      _$ActiveStolImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "stol_nomi")
  String get stolNomi;
  @override
  @JsonKey(name: "QR")
  String get qr;
  @override
  @JsonKey(name: "active")
  bool get active;
  @override
  @JsonKey(name: "kafe_id")
  String get kafeId;
  @override
  @JsonKey(name: "zone_id")
  String get zoneId;
  @override
  @JsonKey(name: "ofisiant_id")
  String? get ofisiantId;
  @override
  @JsonKey(name: "code")
  int? get code;
  @override
  @JsonKey(name: "xizmat_id")
  String? get xizmatId;
  @override
  @JsonKey(ignore: true)
  _$$ActiveStolImplCopyWith<_$ActiveStolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ofisiant _$OfisiantFromJson(Map<String, dynamic> json) {
  return _Ofisiant.fromJson(json);
}

/// @nodoc
mixin _$Ofisiant {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "kafe_id")
  String get kafeId => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_id")
  String get adminId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfisiantCopyWith<Ofisiant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfisiantCopyWith<$Res> {
  factory $OfisiantCopyWith(Ofisiant value, $Res Function(Ofisiant) then) =
      _$OfisiantCopyWithImpl<$Res, Ofisiant>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "kafe_id") String kafeId,
      @JsonKey(name: "admin_id") String adminId});
}

/// @nodoc
class _$OfisiantCopyWithImpl<$Res, $Val extends Ofisiant>
    implements $OfisiantCopyWith<$Res> {
  _$OfisiantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? kafeId = null,
    Object? adminId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      kafeId: null == kafeId
          ? _value.kafeId
          : kafeId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfisiantImplCopyWith<$Res>
    implements $OfisiantCopyWith<$Res> {
  factory _$$OfisiantImplCopyWith(
          _$OfisiantImpl value, $Res Function(_$OfisiantImpl) then) =
      __$$OfisiantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "kafe_id") String kafeId,
      @JsonKey(name: "admin_id") String adminId});
}

/// @nodoc
class __$$OfisiantImplCopyWithImpl<$Res>
    extends _$OfisiantCopyWithImpl<$Res, _$OfisiantImpl>
    implements _$$OfisiantImplCopyWith<$Res> {
  __$$OfisiantImplCopyWithImpl(
      _$OfisiantImpl _value, $Res Function(_$OfisiantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? kafeId = null,
    Object? adminId = null,
  }) {
    return _then(_$OfisiantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      kafeId: null == kafeId
          ? _value.kafeId
          : kafeId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfisiantImpl implements _Ofisiant {
  const _$OfisiantImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "kafe_id") required this.kafeId,
      @JsonKey(name: "admin_id") required this.adminId});

  factory _$OfisiantImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfisiantImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "kafe_id")
  final String kafeId;
  @override
  @JsonKey(name: "admin_id")
  final String adminId;

  @override
  String toString() {
    return 'Ofisiant(id: $id, username: $username, kafeId: $kafeId, adminId: $adminId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfisiantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.kafeId, kafeId) || other.kafeId == kafeId) &&
            (identical(other.adminId, adminId) || other.adminId == adminId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, kafeId, adminId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfisiantImplCopyWith<_$OfisiantImpl> get copyWith =>
      __$$OfisiantImplCopyWithImpl<_$OfisiantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfisiantImplToJson(
      this,
    );
  }
}

abstract class _Ofisiant implements Ofisiant {
  const factory _Ofisiant(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "username") required final String username,
          @JsonKey(name: "kafe_id") required final String kafeId,
          @JsonKey(name: "admin_id") required final String adminId}) =
      _$OfisiantImpl;

  factory _Ofisiant.fromJson(Map<String, dynamic> json) =
      _$OfisiantImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "kafe_id")
  String get kafeId;
  @override
  @JsonKey(name: "admin_id")
  String get adminId;
  @override
  @JsonKey(ignore: true)
  _$$OfisiantImplCopyWith<_$OfisiantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
