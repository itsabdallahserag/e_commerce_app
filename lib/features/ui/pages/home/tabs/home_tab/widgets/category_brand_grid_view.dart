import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
class CategoryBrandGridView extends StatelessWidget {
  final String dataName ;
  final String imageUrl ;
  const CategoryBrandGridView({super.key,required this.dataName,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          ) ,
          itemBuilder:(context, index) => CategoryBrandItem(dataName: dataName,imageUrl:imageUrl )),
    );
  }
}
