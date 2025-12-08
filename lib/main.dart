
import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/cash/shared_prefs_utils.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/home/home_screen.dart';

void main(){
  configureDependencies();
  String routeName ;
  var token = SharedPrefsUtils.getData(key: 'token');
  if(token == null){
    routeName = AppRoutes.login ;
  }else{
    routeName = AppRoutes.home;
  }
  runApp(MyApp(routeName:routeName));
}
class MyApp extends StatelessWidget {
  final String routeName ;
  const MyApp({super.key,required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:routeName ,
          routes: {
            AppRoutes.login : (context) => LoginScreen(),
            AppRoutes.register : (context) => RegisterScreen(),
            AppRoutes.home : (context) => HomeScreen(),
            AppRoutes.productDetails : (context) => ProductDetailsScreen(),
            AppRoutes.cartDetails : (context) => CartScreen(),
          },
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          darkTheme:AppTheme.darkTheme ,
        );
      },
    );
  }
}