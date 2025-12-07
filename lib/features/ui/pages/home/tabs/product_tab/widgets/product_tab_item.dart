import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductTabItem extends StatelessWidget {
  final Product product;
  const ProductTabItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.grayLight,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover!,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 40, color: AppColors.red),
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular18primary,
                    ),
                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Text(
                          'EGP ${product.price}',
                          style: AppStyles.regular18primary,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '${product.price! * 2}',
                          style: TextStyle(
                            color: AppColors.grayDark,
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.grayDark,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Text('Review (${product.ratingsAverage})',
                            style: AppStyles.regular12Primary),
                        Image.asset(AppImages.iconStar),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add,
                                size: 22, color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.iconFavoritePrimary,),
            ),
          ),
        ],
      ),
    );
  }
}
