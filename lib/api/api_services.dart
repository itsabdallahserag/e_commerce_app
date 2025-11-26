import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/end_points.dart';
import 'package:e_commerce_app/api/models/request/login_request_dto.dart';
import 'package:e_commerce_app/api/models/responce/auth_responce_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'models/request/register_request_dto.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.apiLogin)
  Future<AuthResponceDto> login(@Body() LoginRequestDto loginRequest);
  @POST(EndPoints.apiRegister)
  Future<AuthResponceDto> register(@Body() RegisterRequestDto registerRequest);
}

