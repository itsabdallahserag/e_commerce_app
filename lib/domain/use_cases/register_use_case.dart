import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entites/request/register_request.dart';
@injectable
class RegisterUseCase{
  AuthRepository authRepository ;
  RegisterUseCase({required this.authRepository});
  Future<AuthResponce>invoke(RegisterRequest registerRequest){
    return authRepository.register(registerRequest);
  }
}