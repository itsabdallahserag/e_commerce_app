import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/cash/shared_prefs_utils.dart';
import 'package:e_commerce_app/core/utils/app_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/auth_states.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/features/ui/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc/bloc.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,AuthStates>(
      bloc:viewModel ,
      listener:(context, state) {
        if(state is AuthLoagingState){
          AppDialogUtils.showLoading(context: context, colorCircle: Theme.of(context).canvasColor,style: Theme.of(context).textTheme.bodyMedium!);
        }else if(state is AuthErrorState){
          AppDialogUtils.hideLoading(context);
          AppDialogUtils.showMessage(context: context, message: state.message,title: 'Error' ,style: Theme.of(context).textTheme.bodyMedium!,posActionName: 'oK');
        }else if(state is AuthSuccesState){
          AppDialogUtils.hideLoading(context);
          AppDialogUtils.showMessage(context: context, message: 'Sign In Successfully',title: 'Success' ,style: Theme.of(context).textTheme.bodyMedium!,posActionName: 'oK',
          posActionCallBack:() {
            SharedPrefsUtils.saveData(key: 'token', value: state.authResponce.token??'');
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
            );
          },);
        }
      },
      child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 35.h ,bottom:5.h ,left: 97.w,right: 97.w
                            ),
                            child: Image.asset(AppImages.splash),
                          ),
                          Text('Welcome To E Commerce',style: Theme.of(context).textTheme.displayLarge,),
                          SizedBox(height: 20.h,),
                          Text('Email',style: Theme.of(context).textTheme.displayMedium,),
                          SizedBox(height: 10.h,),
                          CustomTextField(
                              hintText: 'Enter Your Email',
                              controller: emailController,
                              validator:(val) =>  Validators.validateEmail(val),
                          ),
                          SizedBox(height: 20.h,),
                          Text('Password',style: Theme.of(context).textTheme.displayMedium,),
                          SizedBox(height: 10.h,),
                          CustomTextField(
                            hasSuffix: true,
                            obsecureText: true,
                            hintText: 'Enter Your Password',
                            controller: passwordController,
                            validator: (val) => Validators.validatePassword(val),
                          ),
                          SizedBox(height: 2.h,),
                         Row(
                           children: [
                             TextButton(
                                  //todo: forget the password
                                    onPressed: () {},
                                    child: Text('Forget Password ?',style:Theme.of(context).textTheme.displaySmall ,)),
                             Spacer()
                           ],
                         ),
                          SizedBox(height: 20.h,),
                          SizedBox(
                            height: 80.h,
                            child: CustomElevatedButton(
                                text: 'Login',
                                textStyle: Theme.of(context).textTheme.headlineLarge,
                                onPressed: () {
                                  viewModel.login(passwordController.text, emailController.text);
                                },),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('not have account?',style: Theme.of(context).textTheme.displayMedium ,),
                              TextButton(
                                //todo: forget the password
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: Text('create account?',style:Theme.of(context).textTheme.labelLarge,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

      ),
    );
  }
}
