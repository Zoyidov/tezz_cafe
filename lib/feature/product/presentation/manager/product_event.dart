part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductByMenuId extends ProductEvent {
  final String menuId;

  GetProductByMenuId(this.menuId);
}

class ProductIncrement extends ProductEvent {}

class ProductDecrement extends ProductEvent {}

class SetProductCount extends ProductEvent {}
