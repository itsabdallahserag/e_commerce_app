import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/add_wishlist_responce_mapper.dart';
import 'package:e_commerce_app/api/models/request/add_product_request_dto.dart';
import 'package:e_commerce_app/core/cash/shared_prefs_utils.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WishListRemoteDataSource)
class WishListCartRemoteDataSourceImpl implements WishListRemoteDataSource{
  final ApiServices apiServices ;
  WishListCartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddWishListResponce> addWishList(String productId) async {
    try{
      AddProductRequestDto productRequest = AddProductRequestDto(
          productId: productId
      );
      var token = SharedPrefsUtils.getData(key: 'token') as String?;
      var addWishListResponce = await apiServices.addWishList(productRequest, token??'');
      return addWishListResponce.toAddWishListResponce();
    }on DioException catch (e){
      String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
      throw ServerException(message: message);
    }
  }
}



























/*
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

  @override
  Future<GetCartResponce> deleteProductFromCart(String productId)async {
    try{
      var token = SharedPrefsUtils.getData(key: 'token') as String?;
      var deleteItemCartResponce = await apiServices.deleteProductFromCart(productId, token??"");
      return deleteItemCartResponce.toGetCartResponce();
    }on DioException catch (e){
      String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponce> updateProductInCart(String productId, int count)async {
    try{
      CountRequestDto countRequestDto = CountRequestDto(
        count: '$count'
      );
      var token = SharedPrefsUtils.getData(key: 'token') as String?;
      var updateItemCartResponce = await apiServices.updateProductInCart(productId, token??'', countRequestDto);
      return updateItemCartResponce.toGetCartResponce();
    }on DioException catch (e){
      String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
      throw ServerException(message: message);
    }
  }
 */