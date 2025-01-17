import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_example/bloc/product_bloc.dart';
import 'package:bloc_test_example/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Product Bloc Test", () {
    test("Initial Value", () {
      final productBloc = ProductBloc();
      expect(
          productBloc.state, ProductInitial()); // Memeriksa state awal langsung
    });

    blocTest<ProductBloc, ProductState>(
      "Add Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(const Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        ProductLoaded([const Product(name: "Apel", price: 2000)]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      "Add 2 Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(const Product(name: "Apel", price: 2000)));
        bloc.add(AddProduct(const Product(name: "Durian", price: 100000)));
      },
      expect: () => [
        ProductLoaded([const Product(name: "Apel", price: 2000)]),
        ProductLoaded([
          const Product(name: "Apel", price: 2000),
          Product(name: "Durian", price: 100000)
        ]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      "Remove Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(RemoveProduct(const Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        ProductInitial(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      "Remove Products(ProductLoaded)",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(const Product(name: "Apel", price: 2000)));
        bloc.add(RemoveProduct(const Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        ProductLoaded([Product(name: "Apel", price: 2000)]),
        ProductLoaded([])
      ],
    );
  });
}
