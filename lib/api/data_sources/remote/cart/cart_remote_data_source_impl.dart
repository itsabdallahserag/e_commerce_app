import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/add_cart_responce_mapper.dart';
import 'package:e_commerce_app/api/mappers/get_cart_responce_mapper.dart';
import 'package:e_commerce_app/api/models/request/add_product_request_dto.dart';
import 'package:e_commerce_app/core/cash/shared_prefs_utils.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRemoteDataSource)
class AddCartRemoteDataSourceImpl implements CartRemoteDataSource{
  final ApiServices apiServices ;
  AddCartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddCartResponce> addCart(String productId)async {
    try{
      AddProductRequestDto productRequest = AddProductRequestDto(
          productId: productId
      );
      var token = SharedPrefsUtils.getData(key: 'token') as String?;
      var addCartResponce = await apiServices.addCart(productRequest, token??'');
      return addCartResponce.toAddCartResponce();
    }on DioException catch (e){
      String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponce> getCart() async{
    try{
      var token = SharedPrefsUtils.getData(key: 'token') as String?;
      var getCartResponce = await apiServices.getCart(token??'');
      return getCartResponce.toGetCartResponce();
    }on DioException catch (e){
      String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
      throw ServerException(message: message);
    }
  }
}