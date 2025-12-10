import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase{
  CartRepository getCartRepository;
  GetCartUseCase({required this.getCartRepository});
  Future<GetCartResponce> invoke () {
    return getCartRepository.getCart();
  }
}