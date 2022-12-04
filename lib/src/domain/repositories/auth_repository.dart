import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/domain/entities/login_body.dart';

abstract class AuthRepository {

  Future<DataState<bool>> requestLogin(LoginBody loginBody);
}
