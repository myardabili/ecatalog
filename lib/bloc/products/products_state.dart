// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {}

final class ProductsInitial extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ProductsLoading extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsILoaded extends ProductsState {
  final List<ProductResponseModel> data;
  final int offset;
  final int limit;
  final bool isNext;
  ProductsILoaded({
    required this.data,
    this.offset = 0,
    this.limit = 10,
    this.isNext = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data, offset, limit, isNext];
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError({
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
