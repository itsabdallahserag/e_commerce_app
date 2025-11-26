
import 'package:e_commerce_app/api/models/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/entites/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest{
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword
    );
  }
}