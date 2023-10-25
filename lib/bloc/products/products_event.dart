part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}
