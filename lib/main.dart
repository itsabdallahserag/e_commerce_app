import 'package:e_commerce_app/core/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/core/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/core/features/ui/pages/home/home_screen.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:AppRoutes.login ,
          routes: {
            AppRoutes.login : (context) => LoginScreen(),
            AppRoutes.register : (context) => RegisterScreen(),
            AppRoutes.home : (context) => HomeScreen(),
          },
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          darkTheme:AppTheme.darkTheme ,
        );
      },
    );
  }
}