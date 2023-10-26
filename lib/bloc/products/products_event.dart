part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class NextProductsEvent extends ProductsEvent {}
