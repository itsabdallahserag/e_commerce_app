import 'package:e_commerce_app/domain/entites/request/login_request.dart';
import 'package:e_commerce_app/domain/entites/request/register_request.dart';
import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../data_sources/remote/auth/auth_remote_data_source.dart';
@Injectable(as:AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource ;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<AuthResponce> login(LoginRequest loginRequest) {
   return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponce> register(RegisterRequest registerRequest) {
    // TODO: implement register
    return authRemoteDataSource.register(registerRequest);
  }
}