
import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/home/home_screen.dart';

void main(){
  configureDependencies();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:AppRoutes.home ,
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