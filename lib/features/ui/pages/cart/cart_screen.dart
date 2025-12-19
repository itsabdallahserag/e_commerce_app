import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_toast_utils.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartViewModel.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: AppStyles.medium20primary),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, color: AppColors.primary, size: 22),
          ),
          BlocBuilder<CartViewModel, CartStates>(
            builder: (context, state) {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -2, end: -2),
                badgeAnimation: badges.BadgeAnimation.scale(
                  animationDuration: Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                ),
                badgeContent: Text(
                  '${CartViewModel.get(context).numCartItems}',
                  style: TextStyle(color: Colors.white),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: Colors.red,
                ),
                child: Image.asset(AppImages.iconCart),
              );
            },
          ),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocListener<CartViewModel,CartStates>(
          listener: (context, state) {
            if(state is GetCartSuccesState){
              AppToastUtils.showToastMsg(message: state.message??'', backgroundColor: AppColors.blue, textColor: AppColors.white);
            }
          },
          child: BlocBuilder<CartViewModel, CartStates>(
            builder: (context, state) {
              if (state is GetCartErrorState) {
                return MainErrorWidget(
                  message: state.message,
                  onRetry: () {
                    CartViewModel.get(context).getCart();
                  },
                );
              } else if (state is GetCartSuccesState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final product = state.getCart.products![index].product!;
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
                                  buildImageContainer(imageCover: product.imageCover ?? ''),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // TITLE + DELETE
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                product.title!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyles.medium18primary,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                CartViewModel.get(context).deleteItemInCart(state.getCart.products![index].product!.id??'');
                                              },
                                              icon: Icon(Icons.delete_forever, size: 26, color: AppColors.primary),
                                            )
                                          ],
                                        ),

                                        // PRICE + QTY
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'EGP ${state.getCart.products![index].price}',
                                                style: AppStyles.medium18primary,
                                              ),
                                            ),
                                            Container(
                                              width: 125.w,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: AppColors.primary,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      int count = state.getCart.products![index].count ?? 1;
                                                      if(count > 1){
                                                        count--;
                                                      }
                                                      CartViewModel.get(context).updateItemInCart
                                                        (state.getCart.products![index].product!.id??'', count);
                                                    },
                                                    child: Icon(Icons.remove_circle_outline, size: 20, color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${state.getCart.products![index].count ?? 1}',
                                                    style: AppStyles.medium18white,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      int count = state.getCart.products![index].count ?? 1;
                                                      count++;
                                                      CartViewModel.get(context).updateItemInCart
                                                        (state.getCart.products![index].product!.id??'', count);
                                                    },
                                                    child: Icon(Icons.add_circle_outline, size: 20, color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            )
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
                        separatorBuilder: (context, index) => SizedBox(height: 10.h),
                        itemCount: state.getCart.products?.length ?? 0,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total price', style: AppStyles.medium18gray),
                            Text('EGP ${state.getCart.totalCartPrice}', style: AppStyles.medium18primary),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50.h,
                            width: 270.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Check Out', style: AppStyles.medium20white),
                                Icon(Icons.arrow_right_alt, size: 22, color: AppColors.white)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h)
                  ],
                );
              } else {
                return MainLoadingWidget();
              }
            },
          ),
        ),
      ),
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
