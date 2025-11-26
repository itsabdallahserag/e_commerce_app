import 'package:e_commerce_app/api/mappers/user_mapper.dart';
import 'package:e_commerce_app/api/models/responce/auth_responce_dto.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/entites/responce/auth_responce.dart';

extension AuthResponceMapper on AuthResponceDto{
  AuthResponce toAuthResponceDto(){
    if(token != null || token!.isNotEmpty || user != null){
      return AuthResponce(
          message: message,
          token: token,
          user: user?.toUserDto()
      );
    }else{
      throw ServerException(message: 'Failed Auth');
    }
  }
}