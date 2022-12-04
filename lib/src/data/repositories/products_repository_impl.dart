import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/local/local_data_source.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/remote/api_services.dart';
import 'package:kortoba_flutter_task/src/data/models/product_model.dart';
import 'package:kortoba_flutter_task/src/domain/entities/comment.dart';
import 'package:kortoba_flutter_task/src/domain/entities/product.dart';
import 'package:kortoba_flutter_task/src/domain/entities/story.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/products_repository.dart';


class ProductsRepositoryImpl extends ProductsRepository {
  final ApiService _apiServices;
  final LocalDataSource _localDataSource;

  ProductsRepositoryImpl(this._apiServices,this._localDataSource);


  @override
  Future<DataState<List<Product>?>> getProducts() async{
    try {
      final httpResponse = await _apiServices.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.products);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<int> addProductToFavorite(Product? product) async{
    return await _localDataSource.insert(LocalDataSource.favoriteProductsTable,{
    'id' : product?.id ,
    'name' : product?.name,
    'image_link' : product?.imageLink,
    'price' : product?.price,
    'description': product?.description
    });
  }

  @override
  Future<List<Product>> getFavoriteProducts() async{
    List<Product> products = [];
    var result =  await _localDataSource.queryAllRows(LocalDataSource.favoriteProductsTable);
    for (var element in result) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<int> removeProductFromFavoriteByProductId(int productId) async{
    var result = await _localDataSource.delete(LocalDataSource.favoriteProductsTable,productId);
    return result;
  }
}
