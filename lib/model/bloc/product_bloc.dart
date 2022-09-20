import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> cardProduct = [];

  ProductBloc() : super(SuccessState(count: 0)) {
    on<AddToCard>((event, emit) {
      // TODO: implement event handler
      cardProduct.add(event.prd!);
    });
    on<DelCard>((event, emit) {
      // TODO: implement event handler
      cardProduct.remove(event.prd!);
    });
  }
}
