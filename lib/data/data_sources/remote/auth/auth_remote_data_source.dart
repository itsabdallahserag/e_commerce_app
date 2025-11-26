import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';

import '../../../../domain/entites/request/login_request.dart';
import '../../../../domain/entites/request/register_request.dart';
import '../../../../domain/repository/auth/auth_repository.dart';

abstract class AuthRemoteDataSource{
  Future<AuthResponce>login(LoginRequest loginRequest);
  Future<AuthResponce>register(RegisterRequest registerRequest);
}