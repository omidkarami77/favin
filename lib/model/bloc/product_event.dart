part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class AddToCard extends ProductEvent {
  Product? prd;
  AddToCard({this.prd});
}

class DelCard extends ProductEvent {
  Product? prd;
  DelCard({this.prd});
}
