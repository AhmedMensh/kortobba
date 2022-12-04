import 'package:kortoba_flutter_task/src/core/constants.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/preferences/preferences_storage.dart';

class SessionManger {
  String? getBearerToken() {
    return PreferencesStorage().getString(kUserToken);
  }

  bool isAuthorized() {
    return PreferencesStorage().getString(kUserToken)?.isNotEmpty ?? false;
  }
}
