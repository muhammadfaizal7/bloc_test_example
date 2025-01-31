import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final int price;

  const Product({required this.name, required this.price});

  @override
  List<Object?> get props => [name, price];
}
