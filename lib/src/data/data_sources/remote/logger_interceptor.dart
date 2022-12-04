import 'package:dio/dio.dart';
import 'package:kortoba_flutter_task/src/core/session_manger.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {

  Logger logger = Logger(
    // Customize the printer
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request => $requestPath');  // Debug log
    logger.d('Error: ${err.error}, Message: ${err.message}'); // Error log
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request => $requestPath'); // Info log
     // Info log
    logger.i('QueryParameters => ${options.queryParameters}'); // Info log
    options.headers['Authorization'] =
    'Bearer ${SessionManger().getBearerToken()}';
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('StatusCode: ${response.statusCode}, Data: ${response.data}'); // Debug log
    return super.onResponse(response, handler);
  }
}