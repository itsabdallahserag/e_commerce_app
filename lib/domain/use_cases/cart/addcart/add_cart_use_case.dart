import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase{
  CartRepository addCartRepository;
  AddCartUseCase({required this.addCartRepository});
  Future<AddCartResponce> invoke (String productId) {
    return addCartRepository.addCart(productId);
  }
}