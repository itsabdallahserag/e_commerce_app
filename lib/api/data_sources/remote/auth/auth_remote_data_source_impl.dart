import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/auth_responce_mapper.dart';
import 'package:e_commerce_app/api/mappers/login_request_mapper.dart';
import 'package:e_commerce_app/api/mappers/register_request_mapper.dart';
import 'package:e_commerce_app/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/request/login_request.dart';
import 'package:e_commerce_app/domain/entites/request/register_request.dart';
import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiServices apiServices ;
  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponce> login(LoginRequest loginRequest)async {
    var authResponce = await apiServices.login(loginRequest.toLoginRequestDto());
    return authResponce.toAuthResponceDto();
  }

  @override
  Future<AuthResponce> register(RegisterRequest registerRequest)async {
    var authResponce = await apiServices.register(registerRequest.toRegisterRequestDto());
    return authResponce.toAuthResponceDto();
  }




}
/*
 @override
  Future<AuthResponce> login(LoginRequest loginRequest)async {
    var authResponce = await apiServices.login(loginRequest.toLoginRequestDto());
    return authResponce.toAuthResponceDto();
  }

  @override
  Future<AuthResponce> register (RegisterRequest registerRequest)async {
   var authResponce = await apiServices.register(registerRequest.toRegisterRequestDto());
   return authResponce.toAuthResponceDto();
  }
 */