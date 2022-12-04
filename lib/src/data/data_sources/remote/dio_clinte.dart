import 'package:dio/dio.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/remote/logger_interceptor.dart';
class DioClient{

  final _dio = Dio();
  Dio create(){
    _dio.interceptors.add(LoggerInterceptor());
    return _dio;
  }
}