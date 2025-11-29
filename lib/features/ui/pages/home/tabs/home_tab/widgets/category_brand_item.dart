import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryBrandItem extends StatelessWidget {
  final Category category ;
  const CategoryBrandItem({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w, // ثابت لكل عنصر
      height: 120.h, // ثابت لكل عنصر
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 75.h,
            width: 75.h,
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: category.image!,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 5), // مسافة ثابتة بين الصورة والنص
          Text(
            category.name!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
