import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/domain/entities/product.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(this._productsRepository) : super(const ProductsInitial());

  Future<void> getProducts() async {
    emit(const ProductsLoading());
    final dataState = await _productsRepository.getProducts();

    if (dataState is DataSuccess) {
      final products = dataState.data;
      if(products == null || products.isEmpty){
        emit(const ProductsEmpty());
      }else {
        emit(ProductsSuccess(products));
      }
    }

    if (dataState is DataFailed) {
      emit(ProductsError(dataState.error?.message ?? ""));
    }
  }
}
