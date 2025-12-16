import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/utils/app_dialog.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/auth_states.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is AuthLoagingState){
          DialogUtils.showLoading(context: context, colorCircle: Theme.of(context).canvasColor,style: Theme.of(context).textTheme.bodyMedium!);
        }else if(state is AuthErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.message,title: 'Error' ,style: Theme.of(context).textTheme.bodyMedium!,posActionName: 'oK');
        }else if(state is AuthSuccesState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: 'Sign Up Successfully',title: 'Success' ,style: Theme.of(context).textTheme.bodyMedium!,posActionName: 'oK');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 35.h ,bottom: 5.h ,left: 97.w,right: 97.w
                      ),
                      child: Image.asset(AppImages.splash),
                    ),
                     Text('Full Name',style: Theme.of(context).textTheme.displayMedium,),
                     SizedBox(height: 10.h,),
                    CustomTextField(
                      hintText: 'Enter Your Full Name',
                      controller: fullNameController,
                      validator:(val) =>  Validators.validateFullName(val),
                    ),
                     SizedBox(height: 15.h,),
                    Text('Mobile Number',style: Theme.of(context).textTheme.displayMedium,),
                    SizedBox(height: 10.h,),
                    CustomTextField(
                      hintText: 'Enter Your Mobile Number.',
                      controller: mobileNumberController,
                      validator: (val) => Validators.validatePhoneNumber(val),
                    ),
                    SizedBox(height: 15.h,),
                     Text('Password',style: Theme.of(context).textTheme.displayMedium,),
                     SizedBox(height: 10.h,),
                    CustomTextField(
                      hasSuffix: true,
                      obsecureText: true,
                      hintText: 'Enter Your Password',
                      controller: passwordController,
                      validator: (val) => Validators.validatePassword(val),
                    ),
                     SizedBox(height: 15.h,),
                    Text('Confirm Password',style: Theme.of(context).textTheme.displayMedium,),
                    SizedBox(height: 10.h,),
                    CustomTextField(
                      hasSuffix: true,
                      obsecureText: true,
                      hintText: 'Enter Confirm Password',
                      controller: rePasswordController,
                      validator: (val) =>Validators.validateConfirmPassword(val, passwordController.text) ,
                    ),
                    SizedBox(height: 15.h,),
                    Text('Email',style: Theme.of(context).textTheme.displayMedium,),
                    SizedBox(height: 10.h,),
                    CustomTextField(
                      hintText: 'Enter Your Email',
                      controller: emailController,
                      validator:(val) =>  Validators.validateEmail(val),
                    ),
                    SizedBox(height: 15.h,),
                    SizedBox(
                      height: 80.h,
                      child: CustomElevatedButton(
                        text: 'Sign Up',
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        onPressed:() {
                          viewModel.register(passwordController.text, emailController.text, fullNameController.text, mobileNumberController.text,rePasswordController.text );
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  LoginScreen()));
                        },
                      ),
                    ),
                     SizedBox(height: 10.h,),
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
