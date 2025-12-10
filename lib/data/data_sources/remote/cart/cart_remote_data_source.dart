import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';

abstract class CartRemoteDataSource{
  Future<AddCartResponce> addCart(String productId);
  Future<GetCartResponce> getCart();
}