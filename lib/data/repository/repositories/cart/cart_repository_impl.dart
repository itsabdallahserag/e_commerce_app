import 'package:e_commerce_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/repository/cart/cart_repository.dart';
@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource ;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<AddCartResponce> addCart(String productId) {
    return cartRemoteDataSource.addCart(productId);
  }

  @override
  Future<GetCartResponce> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<GetCartResponce> deleteProductFromCart(String productId) {
    return cartRemoteDataSource.deleteProductFromCart(productId);
  }

  @override
  Future<GetCartResponce> updateProductInCart(String productId, int count) {
    return cartRemoteDataSource.updateProductInCart(productId, count);
  }
}