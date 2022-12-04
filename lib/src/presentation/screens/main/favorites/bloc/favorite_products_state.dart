part of 'favorite_products_cubit.dart';

abstract class FavoriteProductsState extends Equatable {
  final String? error;
  final List<Product>? products;

  const FavoriteProductsState({this.products, this.error});

  @override
  List<Object?> get props => [products, error];
}

class FavoriteProductsInitial extends FavoriteProductsState {
  const FavoriteProductsInitial();
}

class FavoriteProductsEmpty extends FavoriteProductsState {
  const FavoriteProductsEmpty();
}

class FavoriteProductsSuccess extends FavoriteProductsState {
  const FavoriteProductsSuccess(List<Product> products)
      : super(products: products);
}
