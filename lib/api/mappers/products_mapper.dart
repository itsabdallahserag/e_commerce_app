import 'package:e_commerce_app/api/mappers/product_mapper.dart';
import 'package:e_commerce_app/api/models/responce/cart/getcart/products_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/products.dart';

extension ProductsMapper on ProductsDto{
  toProducts(){
    return Products(
      id: id,
      product: product?.toProduct(),
      count: count,
      price: price

    );
  }
}