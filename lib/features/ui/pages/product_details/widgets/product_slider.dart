import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class ProductSlider extends StatelessWidget {
  final List<String>? productImages  ;
  const ProductSlider({super.key,required this.productImages});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ImageSlideshow(
              width: 400,
              height: 300,
              initialPage: 0,
              indicatorColor: AppColors.primary,
              indicatorBackgroundColor: AppColors.white,
              autoPlayInterval: 3000,
              isLoop: true,
              children: productImages!.map((url) =>  CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 40, color: AppColors.red),
              ),).toList()
          ),
        ),
        InkWell(
          // todo : add product to favorite
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
    );
  }
}
