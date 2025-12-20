import 'package:e_commerce_app/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/addwishlist/add_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/deletewishlist/delete_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/getwishlist/get_wishlist_responce.dart';
import 'package:e_commerce_app/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository{
  WishListRemoteDataSource wishListRemoteDataSource;
  WishListRepositoryImpl({required this.wishListRemoteDataSource});
  @override
  Future<AddWishListResponce> addWishList(String productId) {
    return wishListRemoteDataSource.addWishList(productId);
  }

  @override
  Future<GetWishListResponce> getWishList() {
    return wishListRemoteDataSource.getWishList();
  }

  @override
  Future<DeleteWishlistResponce> deleteProductFromWishList(String productId) {
    return wishListRemoteDataSource.deleteProductFromWishList(productId);
  }
}