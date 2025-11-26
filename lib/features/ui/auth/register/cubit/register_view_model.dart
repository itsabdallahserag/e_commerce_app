import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/entites/request/login_request.dart';
import 'package:e_commerce_app/domain/entites/request/register_request.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<AuthStates>{
  var formKey = GlobalKey<FormState>();
  RegisterUseCase registerUseCase ;
  RegisterViewModel({required this.registerUseCase}):super(AuthLoagingState());
  void register(String password ,String email,String name,String phone,String rePassword)async{
    emit(AuthLoagingState());
    RegisterRequest registerRequest = RegisterRequest(
      name:name ,
      phone:phone ,
      rePassword:rePassword ,
      password: password,
      email: email
    );
   try{
     var authResponce = await registerUseCase.invoke(registerRequest);
     emit(AuthSuccesState(authResponce: authResponce));
   }on AppException catch(e){
     emit(AuthErrorState(message: e.message!));
   }on DioException catch(e){
     final message = (e.error is AppException)?(e.error as AppException).message : 'unExcepected error Occured' ;
     emit(AuthErrorState(message: message!));
   }
  }
}