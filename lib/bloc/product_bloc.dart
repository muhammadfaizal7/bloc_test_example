import 'package:bloc/bloc.dart';
import 'package:bloc_test_example/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<AddProduct>((event, emit) {
      if (state is ProductInitial) {
        emit(ProductLoaded([event.product]));
      } else if (state is ProductLoaded) {
        final currentProducts = (state as ProductLoaded).products;
        emit(ProductLoaded([...currentProducts, event.product]));
      }
    });

    on<RemoveProduct>((event, emit) {
      if (state is ProductLoaded) {
        final currentProducts = (state as ProductLoaded).products;
        final updatedProducts =
            currentProducts.where((item) => item != event.product).toList();
        emit(ProductLoaded(updatedProducts));
      } else {
        emit(
            state); // Jika state adalah ProductInitial, tetap tidak ada perubahan
      }
    });
  }
}
