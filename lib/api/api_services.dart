import 'package:dio/dio.dart'; import 'package:e_commerce_app/api/end_points.dart';
import 'package:e_commerce_app/api/models/request/count_request_dto.dart';
import 'package:e_commerce_app/api/models/request/login_request_dto.dart';
import 'package:e_commerce_app/api/models/responce/auth_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/brands/brands_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/cart/getcart/get_cart_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/categories/categories_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/products/products_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/wishlist/addwishlist/add_wishlist_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/wishlist/deletewishlist/delete_wishlist_responce_dto.dart';
import 'package:e_commerce_app/api/models/responce/wishlist/getwishlist/get_wishlist_responce_dto.dart';
import 'package:retrofit/retrofit.dart'; import 'models/request/add_product_request_dto.dart';
import 'models/request/register_request_dto.dart';
part 'api_services.g.dart';
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
  @POST(EndPoints.apiLogin)
  Future<AuthResponceDto> login(@Body() LoginRequestDto loginRequest);
  @POST(EndPoints.apiRegister)
  Future<AuthResponceDto> register(@Body() RegisterRequestDto registerRequest);
  @GET(EndPoints.apiCategories)
  Future<CategoriesResponceDto> getAllCategories();
  @GET(EndPoints.apiBrands)
  Future<BrandsResponceDto> getAllBrand();
  @GET(EndPoints.apiProducts)
  Future<ProductsResponceDto> getAllProduct();
  @POST(EndPoints.apiAddOrGetProductToCart)
  Future<AddCartResponceDto>addCart(
      @Body() AddProductRequestDto productRequest,
      @Header('token') String token);
  @GET(EndPoints.apiAddOrGetProductToCart)
  Future<GetCartResponceDto>getCart(
      @Header('token') String token);
  @DELETE('${EndPoints.removeProductInCart}{productId}')
  Future<GetCartResponceDto> deleteProductFromCart(
      @Path() String productId,
      @Header('token') String token);
  @PUT('${EndPoints.removeProductInCart}{productId}')
  Future<GetCartResponceDto> updateProductInCart(
      @Path() String productId,
      @Header('token') String token,
      @Body() CountRequestDto countRequestDto
      );
  @POST(EndPoints.apiAddOrGetProductToWishList)
  Future<AddWishListResponceDto>addWishList(
      @Body() AddProductRequestDto productRequest,
      @Header('token') String token);
  @GET(EndPoints.apiAddOrGetProductToWishList)
  Future<GetWishlistResponceDto>getWishList(
      @Header('token') String token);
  @DELETE('${EndPoints.apiRemoveProducFromWishList}{productId}')
  Future<DeleteWishlistResponceDto> deleteProductFromWishList(
      @Path() String productId,
      @Header('token') String token);
}