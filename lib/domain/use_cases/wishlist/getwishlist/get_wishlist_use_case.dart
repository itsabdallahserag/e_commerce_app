import 'package:e_commerce_app/domain/entites/responce/wishlist/getwishlist/get_wishlist_responce.dart';
import 'package:e_commerce_app/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListUseCase{
  WishListRepository wishListRepository;
  GetWishListUseCase({required this.wishListRepository});
  Future<GetWishListResponce> invoke () {
    return wishListRepository.getWishList();
  }
}