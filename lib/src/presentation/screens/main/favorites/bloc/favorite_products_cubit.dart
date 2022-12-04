import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kortoba_flutter_task/src/domain/entities/product.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/products_repository.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  final ProductsRepository _productsRepository;

  FavoriteProductsCubit(this._productsRepository)
      : super(const FavoriteProductsInitial());

  void addToFavorite(Product? product) async{
     await _productsRepository.addProductToFavorite(product);

  }

  void removeProductFromFavoriteByProductId(int productId) async{
    int rowNumber = await _productsRepository.removeProductFromFavoriteByProductId(productId);
    if(rowNumber >0) getFavoriteProducts();
  }

  void getFavoriteProducts() async {

    List<Product> products = await _productsRepository.getFavoriteProducts();
    if(products == null || products.isEmpty){
      emit(const FavoriteProductsEmpty());
    }else {
      emit(FavoriteProductsSuccess(products));
    }
  }
}
