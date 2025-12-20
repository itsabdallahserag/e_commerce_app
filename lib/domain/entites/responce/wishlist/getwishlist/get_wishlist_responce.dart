
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';


class GetWishListResponce {
  final String? status;
  final int? count;
  final List<Product>? data;

  GetWishListResponce ({
    this.status,
    this.count,
    this.data,
  });
}




