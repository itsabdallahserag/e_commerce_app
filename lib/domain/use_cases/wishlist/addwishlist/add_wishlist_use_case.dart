import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';
import 'package:e_commerce_app/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddWishListUseCase{
  WishListRepository wishlistRepository;
  AddWishListUseCase({required this.wishlistRepository});
  Future<AddWishListResponce> invoke (String productId) {
    return wishlistRepository.addWishList(productId);
  }
}