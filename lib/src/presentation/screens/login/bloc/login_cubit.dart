import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/core/resources/data_state.dart';
import 'package:kortoba_flutter_task/src/domain/entities/login_body.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginForm = GlobalKey<FormState>();
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(const LoginInitial());


  Future<void> login(String email, String password) async {

    bool isValid = loginForm.currentState?.validate() ?? false;
    if (isValid) {
      emit(const LoginLoading());
      var result = await _authRepository.requestLogin(LoginBody(emailController.text, passwordController.text));
      if(result is DataSuccess) {
        emit(const LoginSuccess());
      }else{
        emit(LoginError(result.error?.message ?? "Something went wrong"));
      }
    }
  }

}
