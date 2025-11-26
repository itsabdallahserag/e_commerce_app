import 'package:e_commerce_app/features/ui/pages/home/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/product_tab/product_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenIntialState());
  TextEditingController searchController =TextEditingController();
  int selectedIndex = 0 ;
  List <Widget> tabsList = [HomeTab(),ProductTab(),FavoriteTab(),UserTab()];
  void bottomNavOnTap(int index){
    selectedIndex = index ;
    emit(ChangeSelectedIndexState());
  }

}