part of 'zone_bloc.dart';

class ZoneState {
  final FormzSubmissionStatus status;
  final List<ZoneModel> zone;
  final String message;
  final List<bool> activeZone;
  final List<bool> noActiveZone;

  const ZoneState({
     this.status = FormzSubmissionStatus.initial,
     this.zone = const [],
     this.message = '',
     this.activeZone = const [],
     this.noActiveZone = const [],
  });

  ZoneState copyWith({
    FormzSubmissionStatus? status,
    List<ZoneModel>? zone,
    String? message,
    List<bool>? activeZone,
    List<bool>? noActiveZone,
  }) {
    return ZoneState(
      status: status ?? this.status,
      zone: zone ?? this.zone,
      message: message ?? this.message,
      activeZone: activeZone ?? this.activeZone,
      noActiveZone: noActiveZone ?? this.noActiveZone,
    );
  }
}
