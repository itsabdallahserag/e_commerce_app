
import 'package:e_commerce_app/domain/entites/responce/user.dart';
import 'package:json_annotation/json_annotation.dart';

class AuthResponce {
  final String? message;
  final User? user;
  final String? token;

  AuthResponce ({
    this.message,
    this.user,
    this.token,
  });
}


