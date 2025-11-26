import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';

abstract class AuthStates{}
class AuthLoagingState extends AuthStates{}
class AuthErrorState extends AuthStates{
  String message;
  AuthErrorState({required this.message});
}
class AuthSuccesState extends AuthStates{
  AuthResponce authResponce ;
  AuthSuccesState({required this.authResponce});
}