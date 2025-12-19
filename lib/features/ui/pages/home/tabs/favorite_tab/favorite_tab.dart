import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(14),
      itemBuilder: (context, index) {
        //todo: build item in listView
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.grayLight),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // todo: image container in item
                buildImageContainer(imageCover: ''),
                SizedBox(width: 8.w),
                // todo: the follow of item
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TITLE + DELETE
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // todo : product title
                          Expanded(
                            child: Text(
                              '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.medium18primary,
                            ),
                          ),
                          // todo : add product to favorite
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AppImages.iconFavorite,),
                            ),
                          ),
                        ],
                      ),
                      //todo: PRICE + add to cart
                      Row(
                        children: [
                          // todo: price of product
                          Expanded(
                            child: Text(
                              'EGP ' ' ',
                              style: AppStyles.medium18primary,
                            ),
                          ),
                          // todo: add product to cart
                          CustomElevatedButton(
                            bgColor: AppColors.primary,
                              radius: 15,
                              text: 'Add to Cart',
                              textStyle: AppStyles.medium14white,
                              onPressed: () {},)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      //todo: build seperation between items in listView
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      //todo: number of items in ListView
      itemCount: 6,
    );
  }
  Widget buildImageContainer({required String imageCover}) {
    return Container(
      width: 140.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grayLight),
      ),
      child: CachedNetworkImage(
        imageUrl: imageCover,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.broken_image),
      ),
    );
  }
}
