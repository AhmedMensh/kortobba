
import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/domain/entities/product.dart';

abstract class ProductsRepository {

  Future<DataState<List<Product>?>> getProducts();
  Future<List<Product>> getFavoriteProducts();
  Future<int> addProductToFavorite(Product? product);
  Future<int> removeProductFromFavoriteByProductId(int productId);
}