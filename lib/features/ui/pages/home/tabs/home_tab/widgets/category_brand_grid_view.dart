import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';

class CategoryBrandGridView extends StatelessWidget {
  final List<dynamic> categoryBrandList;

  const CategoryBrandGridView({super.key, required this.categoryBrandList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryBrandList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => CategoryBrandItem(
          category: categoryBrandList[index],
        ),
      ),
    );
  }
}
