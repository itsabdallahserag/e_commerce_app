import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CartViewModel.get(context).getCart();
  }
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 115.h,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('E Commerce',style: Theme.of(context).textTheme.displayLarge,),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 350.w,
                      child: CustomTextField(
                        hintText: 'what do you search for?',
                        controller: viewModel.searchController,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10.w,),
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
              ],
            ),
          ),
          bottomNavigationBar:ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(15),
                  topRight:Radius.circular(15)
              ),
              child:Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: BottomNavigationBar(
                    backgroundColor: Theme.of(context).canvasColor,
                    onTap: viewModel.bottomNavOnTap,
                    currentIndex: viewModel.selectedIndex,
                    type:BottomNavigationBarType.fixed,
                    elevation: 0,
                    items:[
                      buildBottomNavigationBarItem(iconName:viewModel.selectedIndex == 0 ? AppImages.iconHomePrimary:AppImages.iconHome, index: 0),
                      buildBottomNavigationBarItem(iconName:viewModel.selectedIndex == 1 ? AppImages.iconProductPrimary:AppImages.iconProduct, index: 1),
                      buildBottomNavigationBarItem(iconName:viewModel.selectedIndex == 2 ? AppImages.iconFavoritePrimary:AppImages.iconFavorite, index: 2),
                      buildBottomNavigationBarItem(iconName:viewModel.selectedIndex == 3 ? AppImages.iconUserPrimary:AppImages.iconUser, index: 3)
                    ] ),)
          ) ,
          body: viewModel.tabsList[viewModel.selectedIndex],
        );
      },
    );
  }
  BottomNavigationBarItem buildBottomNavigationBarItem({required String iconName,required int index}){
    return BottomNavigationBarItem(
        label:'' ,
        icon: CircleAvatar(
          backgroundColor:viewModel.selectedIndex==index? Theme.of(context).hoverColor:Colors.transparent,
          child: Image.asset(iconName,fit: BoxFit.contain,
          ),
        )
    );
  }
}
