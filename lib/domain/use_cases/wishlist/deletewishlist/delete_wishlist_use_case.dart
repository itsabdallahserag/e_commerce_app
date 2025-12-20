import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/addwishlist/add_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/deletewishlist/delete_wishlist_responce.dart';
import 'package:e_commerce_app/domain/repository/cart/cart_repository.dart';
import 'package:e_commerce_app/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemWishListUseCase{
  WishListRepository wishListRepository;
  DeleteItemWishListUseCase({required this.wishListRepository});
  Future<DeleteWishlistResponce> invoke (String productId) {
    return wishListRepository.deleteProductFromWishList(productId);
  }
}