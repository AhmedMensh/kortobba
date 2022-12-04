import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kortoba_flutter_task/src/core/constants.dart';
import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/preferences/preferences_storage.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/remote/api_services.dart';
import 'package:kortoba_flutter_task/src/data/models/login_response.dart';
import 'package:kortoba_flutter_task/src/domain/entities/comment.dart';
import 'package:kortoba_flutter_task/src/domain/entities/login_body.dart';
import 'package:kortoba_flutter_task/src/domain/entities/story.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/auth_repository.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/products_repository.dart';


class AuthRepositoryImpl extends AuthRepository {
  final ApiService _apiServices;
  final PreferencesStorage _preferencesStorage;
  AuthRepositoryImpl(this._apiServices,this._preferencesStorage);

  @override
  Future<DataState<bool>> requestLogin(LoginBody loginBody) async{
    try {
      final httpResponse = await _apiServices.requestLogin(loginBody);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        await _preferencesStorage.setString(kUserToken, httpResponse.data.access ?? "");
        return const DataSuccess(true);
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
}
