import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style:AppStyles.medium20primary,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon:Icon(Icons.search_outlined,color: AppColors.primary,size: 22,),),
          IconButton(onPressed: () {}, icon:Image.asset(AppImages.iconCart) )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 115.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.grayLight
              )
            ),
            child: Row(
              children: [
                  Container(
                    width: 120.w,
                    height: 114.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.grayLight
                      )
                    ),
                    child: Image.asset(AppImages.imageSlide3,fit: BoxFit.cover,),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nike',style: AppStyles.medium18primary,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever,size: 22,color: AppColors.primary,))
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: () {},icon: Icon(Icons.remove_circle_outline,size: 22,color: AppColors.white,)),
                          Text('1',style:AppStyles.medium18white,),
                          IconButton(onPressed: () {},icon: Icon(Icons.add_circle_outline_outlined,size: 22,color: AppColors.white,)),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Total price',style: AppStyles.medium18gray,),
                  Text('EGP 3,500',style: AppStyles.medium18primary,)
                ],
              ),
              InkWell(
                // todo : add product to cart
                onTap: () {},
                child: Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.iconCart2),
                          SizedBox(width: 25,),
                          Text('Add to cart',style: AppStyles.medium20white,)
                        ],
                      ),
                    )
                ),
              )
            ],
          )
        ],
                )
              ]
            ),
      )
        ])
      );
  }
}
