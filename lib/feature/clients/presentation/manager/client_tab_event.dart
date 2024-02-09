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
  final String cafeId;

  GetTablesByWaitress({required this.cafeId});
}

class GetTablesByCafe extends ClientTabEvent {
  final String cafeId;

  GetTablesByCafe(this.cafeId);
}

class UpdateTableActive extends ClientTabEvent {
  final String code;
  final String tableId;
  final String waiterToken;
  final String cafeId;

  UpdateTableActive({required this.code, required this.tableId, required this.waiterToken, required this.cafeId});
}

class LoginCode extends ClientTabEvent {
  final String tableId;
  final String waiterToken;
  final String cafeId;

  LoginCode({required this.tableId, required this.waiterToken, required this.cafeId});
}
