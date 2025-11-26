import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/entites/request/login_request.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<AuthStates>{
  var formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase ;
  LoginViewModel({required this.loginUseCase}):super(AuthLoagingState());
  void login(String password ,String email)async{
    emit(AuthLoagingState());
    LoginRequest loginRequest = LoginRequest(
      password: password,
      email: email
    );
   try{
     var authResponce = await loginUseCase.invoke(loginRequest);
     emit(AuthSuccesState(authResponce: authResponce));
   }on AppException catch(e){
     emit(AuthErrorState(message: e.message!));
   }on DioException catch(e){
     final message = (e.error is AppException)?(e.error as AppException).message : 'unExcepected error Occured' ;
     emit(AuthErrorState(message: message!));
   }
  }
}