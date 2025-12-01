import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';

class CategoryBrandGridView extends StatelessWidget {
  final List items;
  const CategoryBrandGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          /// Support Category OR Brand
          final imageUrl = item.image ?? '';
          final text = item.name ?? '';

          return CategoryBrandItem(
            imageUrl: imageUrl,
            text: text,
          );
        },
      ),
    );
  }
}
