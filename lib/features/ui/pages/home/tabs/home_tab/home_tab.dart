import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/build_row.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/category_brand_grid_view.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: AppColors.primary,
            indicatorBackgroundColor: AppColors.white,
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              Image.asset(
                AppImages.imageSlide1,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AppImages.imageSlide2,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AppImages.imageSlide3,
                fit: BoxFit.cover,
              ),
            ],
                ),
          ),
            SizedBox(height: 10.h,),
            BuildRow(text: 'Category',onPressed: () {},),
            SizedBox(height: 10.h,),
            CategoryBrandGridView(dataName: 'serag',imageUrl: AppImages.imageSlide1,),
            BuildRow(text: 'Brand',onPressed: () {},),
            SizedBox(height: 10.h,),
            CategoryBrandGridView(dataName: 'serag',imageUrl: AppImages.imageSlide1,)
          ],
        ),
      ),
    );
  }
}
