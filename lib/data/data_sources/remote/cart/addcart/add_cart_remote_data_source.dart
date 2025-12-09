import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';

abstract class AddCartRemoteDataSource{
  Future<AddCartResponce> addCart(String productId);
}