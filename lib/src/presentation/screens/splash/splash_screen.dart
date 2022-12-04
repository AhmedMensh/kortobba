import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/session_manger.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/login/login_screen.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => SessionManger().isAuthorized()
                    ? const MainScreen()
                    : const LoginScreen()),
                (_) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body:const SizedBox());
  }
}
