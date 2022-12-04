import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kortoba_flutter_task/src/config/theme/app_theme.dart';
import 'package:kortoba_flutter_task/src/core/app_blocs.dart';
import 'package:kortoba_flutter_task/src/core/constants.dart';
import 'package:kortoba_flutter_task/src/injector.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/splash/splash_screen.dart';

import 'generated/l10n.dart';
import 'src/config/routes/app_routes.dart';
import 'src/data/data_sources/preferences/preferences_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  await PreferencesStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: getAppBlocs(),
        child: MaterialApp(
          locale: const Locale(kArabicCode),
          // navigatorKey: navigationKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: S().app_name,
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const SplashScreen(),
        ));
  }
}
