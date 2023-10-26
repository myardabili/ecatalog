// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductDatasource datasource;
  ProductsBloc(
    this.datasource,
  ) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await datasource.getPagination(offset: 0, limit: 10);
      result.fold(
        (error) => emit(ProductsError(message: error)),
        (result) {
          bool isNext = result.length == 10;
          emit(ProductsILoaded(data: result, isNext: isNext));
        },
      );
    });
    on<NextProductsEvent>((event, emit) async {
      final currentState = state as ProductsILoaded;
      final result = await datasource.getPagination(
          offset: currentState.offset + 10, limit: 10);
      result.fold(
        (error) => emit(ProductsError(message: error)),
        (result) {
          bool isNext = result.length == 10;
          emit(ProductsILoaded(
            data: [...currentState.data, ...result],
            offset: currentState.offset + 10,
            isNext: isNext,
          ));
        },
      );
    });
  }
}
