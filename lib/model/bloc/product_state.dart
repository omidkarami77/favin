part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingState extends ProductState {}

class SuccessState extends ProductState {
  int? count;
  SuccessState({this.count});
}

class FailedState extends ProductState {
  String fail;
  FailedState({required this.fail});
}
