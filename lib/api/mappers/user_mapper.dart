import 'package:e_commerce_app/api/models/responce/user_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/user.dart';

extension UserMapper on UserDto{
  User toUserDto(){
    return User(
      email: email,
      name: name,
      role: role
    );
  }
}