import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/generated/l10n.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/assets.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/login/bloc/login_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/main_screen.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/custom_progress.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/custome_elevated_button.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/custome_text_field.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit _loginCubit;
  var _obscureText = true;
  @override
  void initState() {
    _loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOFF_WHITE,
      appBar: AppBar(backgroundColor: kOFF_WHITE,),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginCubit.loginForm,
            child: Column(
            children: [
              Image.asset(
                Assets.icLogin,
                width: SizeConfig.screenWidth! * .4,
              ),
              const SizedBox(height: 30,),
              Text(
                S().login,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: kPINK_500),
              ),
              const SizedBox(height: 10,),

              Text(
                S().please_login_to_complete_the_purchase,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  S().user_name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 5,),
              CustomTextField(
                hint: S().user_name,
                controller: _loginCubit.emailController,
                  validator: (text) {
                    if (text?.isEmpty == true) {
                      return S().field_required;
                    }
                    return null;
                  },

              ),

              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  S().password,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextField(
                hint: S().password,
                controller: _loginCubit.passwordController,
                suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText ?Icons.visibility :Icons.visibility_off ,color: Colors.grey,)),
                obscureText: _obscureText,
                  validator: (text) {
                    if (text?.isEmpty == true) {
                      return S().field_required;
                    }
                    return null;
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (_, state) {
                  if (state is LoginLoading) {
                    return const Center(
                      child: CustomProgress(),
                    );
                  }
                  if (state is LoginError) {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      showSnackBar(context, state.error ?? "", color: Colors.red);
                    });
                  }
                  if (state is LoginSuccess) {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                              (_) => false);
                    });
                  }
                  return CustomButton(
                    label: S().enter,
                    action: () {
                      _loginCubit.login(_loginCubit.emailController.text,
                          _loginCubit.passwordController.text);
                    },
                  );
                },
              )
            ],
          ),),
        ),
      ),
    );
  }
}
