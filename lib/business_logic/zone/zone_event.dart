part of 'zone_bloc.dart';

abstract class ZoneEvent {}

class FetchZoneByCafeIdEvent extends ZoneEvent {
  final String cafeId;

  FetchZoneByCafeIdEvent(this.cafeId);
}

class SelectActiveZoneEvent extends ZoneEvent {
  final int index;

  SelectActiveZoneEvent(this.index);
}

class SelectNoActiveZoneEvent extends ZoneEvent {
  final int index;

  SelectNoActiveZoneEvent(this.index);
}
