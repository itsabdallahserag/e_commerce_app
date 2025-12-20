import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_toast_utils.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/favorite_tab/cubit/wishlist_states.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/favorite_tab/cubit/wishlist_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    super.initState();
    WishListViewModel.get(context).getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartViewModel,CartStates>(
      listener: (context, state) {
        if(state is CartSuccesState) {
          AppToastUtils.showToastMsg(
            message:'product added successfully to cart' ,
            backgroundColor: AppColors.blue,
            textColor: AppColors.white,
          );
        }else if(state is CartErrorState) {
          AppToastUtils.showToastMsg(
            message:state.message,
            backgroundColor: AppColors.blue,
            textColor: AppColors.white,
          );
        }
      },
      child: BlocListener<WishListViewModel, WishListStates>(
          listener: (context, state) {
            if (state is DeleteWishListSuccesState ||
                state is AddWishListSuccesState) {
              AppToastUtils.showToastMsg(
                message:state is DeleteWishListSuccesState ?
                'product deleted successfully from wishlist'
                    : 'product added successfully to wishlist' ,
                backgroundColor: AppColors.blue,
                textColor: AppColors.white,
              );
            }
            if (state is GetWishListErrorState) {
              AppToastUtils.showToastMsg(
                message: state.message,
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
              );
            }
            if (state is DeleteWishListErrorState) {
              AppToastUtils.showToastMsg(
                message: state.message,
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
              );
            }
            if (state is AddWishListErrorState) {
              AppToastUtils.showToastMsg(
                message: state.message,
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
              );
            }
          },
          child:BlocBuilder<WishListViewModel,WishListStates>(
        builder: (context, state) {
          if (state is GetWishListErrorState) {
            return MainErrorWidget(
              message: state.message,
            );
          }else if (state is GetWishListSuccesState) {
            final products = WishListViewModel
                .get(context)
                .wishList;
            if (products.isEmpty) {
              return Center(child: Text('No Found Favorite Products',
                  style: AppStyles.medium18primary));
            } else {
              return ListView.separated(
                padding: EdgeInsets.all(14),
                itemCount: products.length,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildWishListItem(context, product);
                },
              );
            }
          }
          else {
            return MainLoadingWidget();
          }
        },
      )
      ),
    );
  }
}

  Widget buildWishListItem(BuildContext context, Product product) {
    return Container(
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grayLight),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //todo : IMAGE
            buildImageContainer(imageCover: product.imageCover ?? ''),
            SizedBox(width: 8.w),
            //todo : DETAILS
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //todo : TITLE + DELETE
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.medium18primary,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            WishListViewModel.get(context)
                                .deleteProductFromWishList(product.id ?? '');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(AppImages.iconFavoriteWishList),
                          ),
                        ),
                      ],
                    ),
                    //todo : PRICE + ADD TO CART
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: Text(
                        'EGP ${product.price} ',
                        style: AppStyles.medium18primary,
                      ),
                    ),
                    CustomElevatedButton(
                      bgColor: AppColors.primary,
                      radius: 15,
                      text: 'Add to Cart',
                      textStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 8
                      ),
                      onPressed: () {
                        CartViewModel.get(context).addCart(product.id??'');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
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
/*
BlocConsumer<WishListViewModel, WishListStates>(
      listener: (context, state) {
        // todo : success messages
        if (state is DeleteWishListSuccesState) {
          AppToastUtils.showToastMsg(
            message: state.message ?? 'deleted successfully',
            backgroundColor: AppColors.blue,
            textColor: AppColors.white,
          );
        } else if (state is AddWishListSuccesState) {
          AppToastUtils.showToastMsg(
            message: state.message ?? 'adding successfully',
            backgroundColor: AppColors.blue,
            textColor: AppColors.white,
          );
        }
        // todo : error messages
        else if (state is GetWishListErrorState) {
          MainErrorWidget(message: state.message);
        } else if (state is DeleteWishListErrorState) {
          AppToastUtils.showToastMsg(
            message: state.message,
            backgroundColor: AppColors.red,
            textColor: AppColors.white,
          );
        } else if (state is AddWishListErrorState) {
          AppToastUtils.showToastMsg(
            message: state.message,
            backgroundColor: AppColors.red,
            textColor: AppColors.white,
          );
        }
      },
      builder: (context, state) {
        if (state is GetWishListLoadingState || state is DeleteWishListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetWishListSuccesState) {
          final products = WishListViewModel.get(context).wishList;

          if (products.isEmpty) {
            return Center(child: Text('No Found Favorite Products', style: AppStyles.medium18primary));
          }

 */
