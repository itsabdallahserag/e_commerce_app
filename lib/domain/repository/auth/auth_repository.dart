import 'package:e_commerce_app/domain/entites/request/register_request.dart';
import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';

import '../../entites/request/login_request.dart';

abstract class AuthRepository{
  Future<AuthResponce>login(LoginRequest loginRequest);
  Future<AuthResponce>register(RegisterRequest registerRequest);
}