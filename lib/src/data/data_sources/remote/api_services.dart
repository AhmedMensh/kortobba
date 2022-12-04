import 'package:dio/dio.dart';
import 'package:kortoba_flutter_task/src/core/constants.dart';
import 'package:kortoba_flutter_task/src/data/models/login_response.dart';
import 'package:kortoba_flutter_task/src/data/models/products_response.dart';
import 'package:kortoba_flutter_task/src/domain/entities/login_body.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/users/login/")
  Future<HttpResponse<LoginResponse>> requestLogin(@Body() LoginBody loginBody);

  @GET('/api/v1/products/')
  Future<HttpResponse<ProductsResponse>> getProducts();

}
