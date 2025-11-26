import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entites/request/login_request.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository ;
  LoginUseCase({required this.authRepository});
  Future<AuthResponce>invoke(LoginRequest loginRequest){
    return authRepository.login(loginRequest);
  }
}