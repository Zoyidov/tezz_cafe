part of 'client_tab_bloc.dart';

abstract class ClientTabEvent {}

class TabChanged extends ClientTabEvent {
  final int index;

  TabChanged({required this.index});
}

class TabChangedNoActive extends ClientTabEvent {
  final int index;

  TabChangedNoActive({required this.index});
}

class PageChanged extends ClientTabEvent {
  final int index;

  PageChanged({required this.index});
}

class PageChangedNoActive extends ClientTabEvent {
  final int index;

  PageChangedNoActive({required this.index});
}

class GetZones extends ClientTabEvent {
  final String cafeId;

  GetZones(this.cafeId);
}

class GetTablesByWaitress extends ClientTabEvent {
  final String waiterId;
  final String cafeId;

  GetTablesByWaitress({required this.waiterId, required this.cafeId});
}
