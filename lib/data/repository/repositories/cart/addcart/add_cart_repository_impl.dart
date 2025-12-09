import 'package:e_commerce_app/data/data_sources/remote/cart/addcart/add_cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/repository/cart/addcart/add_cart_repository.dart';
@Injectable(as: AddCartRepository)
class AddCartRepositoryImpl implements AddCartRepository{
  AddCartRemoteDataSource addCartRemoteDataSource ;
  AddCartRepositoryImpl({required this.addCartRemoteDataSource});
  @override
  Future<AddCartResponce> addCart(String productId) {
    return addCartRemoteDataSource.addCart(productId);
  }
}