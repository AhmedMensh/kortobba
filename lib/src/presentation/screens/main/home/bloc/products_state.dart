part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  final String? error;
  final List<Product>? products;
  const ProductsState({this.error,this.products});
  @override
  List<Object?> get props => [products,error];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}


class ProductsLoading extends ProductsState {
  const ProductsLoading();
}
class ProductsEmpty extends ProductsState {
  const ProductsEmpty();
}


class ProductsError extends ProductsState {
  const ProductsError(String error) :super(error: error);
}


class ProductsSuccess extends ProductsState {
  const ProductsSuccess(List<Product>? products) :super(products: products);
}
