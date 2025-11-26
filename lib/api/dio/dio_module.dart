import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/dio/dio_interceptor.dart';
import 'package:e_commerce_app/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  // 1) BaseOptions
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
    );
  }

  // 2) PrettyDioLogger
  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  // 3) Dio
  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  // 4) ApiServices
  @singleton
  @injectable
  ApiServices provideApiServices(Dio dio) => ApiServices(dio);
}