import 'package:e_commerce_app/api/models/request/login_request_dto.dart';
import 'package:e_commerce_app/domain/entites/request/login_request.dart';

extension LoginRequestMapper on LoginRequest{
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
      email: email,
      password: password
    );
  }
}