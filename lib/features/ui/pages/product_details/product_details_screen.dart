import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_toast_utils.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/product_details/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    CartViewModel.get(context).getCart();
  }
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product ;
    return  BlocListener<CartViewModel,CartStates>(
        listener: (context, state) {
          if(state is CartSuccesState){
            AppToastUtils.showToastMsg(message: 'product added successfully', backgroundColor: AppColors.grayLight, textColor: AppColors.primary);
          }else if (state is CartErrorState){
            AppToastUtils.showToastMsg(message: 'Error in adding product', backgroundColor: AppColors.red, textColor: AppColors.white);
          }
        },
        child: Scaffold(
      appBar: AppBar(
        title: Text('Product Details',style:AppStyles.medium20primary,),
        centerTitle: true,
        actions: [
          Icon(Icons.search_outlined,color: AppColors.primary,size: 22,),
          BlocBuilder<CartViewModel,CartStates>
            (builder:(context, state) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(),));
              },
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -2, end: -2),
                // todo : Animation
                badgeAnimation: badges.BadgeAnimation.scale(
                  animationDuration: Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                ),
                badgeContent: Text(
                  '${CartViewModel.get(context).numCartItems}', style: TextStyle(color: Colors.white),),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: Colors.red,
                ),
                child: Image.asset(AppImages.iconCart),
              ),
            );
          },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSlider(productImages: product.images),
            SizedBox(height:15.h ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(product.title!,style:AppStyles.medium18primary,)),
                Expanded(child: Text('EGP ${product.price}',style:AppStyles.medium18primary ,)),
              ],
            ),
            SizedBox(height:15.h ,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.grayLight,
                      width: 1,
                    )
                  ),
                  child: Text('${product.quantity} Sold',style: AppStyles.medium14primary,),
                ),
                SizedBox(width: 20.w,),
                Image.asset(AppImages.iconStar),
                SizedBox(width: 5.w,),
                Text('${product.ratingsAverage} (${product.ratingsQuantity})',style: AppStyles.regular14primary),
                Spacer(),
                Container(
                  width: 140.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // todo : min the amount of product in cart
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,size: 20,color: AppColors.white,)),
                      Text('1',style:AppStyles.medium18white,),
                        // todo : max the amount of product in cart
                      IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,size: 20,color: AppColors.white,),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:15.h ,),
            Text('Description',style: AppStyles.medium18primary),
            SizedBox(height:5.h ,),
            ReadMoreText(
              product.description!,
              trimMode: TrimMode.Line,
              trimLines: 2,
              trimCollapsedText: ' Read More',
              trimExpandedText: ' Read less',
              style: AppStyles.regular14gray,
              moreStyle: AppStyles.regular14primary,
              lessStyle: AppStyles.regular14primary,
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text('Total price',style: AppStyles.medium18gray,),
                    Text('EGP 3,500',style: AppStyles.medium18primary,)
                  ],
                ),
                Spacer(),
                InkWell(
                  // todo : add product to cart
                  onTap: () {
                    CartViewModel.get(context).addCart(product.id!);
                  },
                  child: Container(
                    height: 50.h,
                    width: 270.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(AppImages.iconCart2),
                        SizedBox(width: 20,),
                        Text('Add to cart',style: AppStyles.medium20white,)
                      ],
                    ),
                                    ),
                ),
                SizedBox(height: 15.h,)
              ],
            )
          ],
        ),
      ),
            )
    );
  }
}
