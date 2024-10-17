import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/pages/login_screen.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0B0B),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 140.h,),
              Text(
                'SING UP',
                style: AppTextStyles.cairoWhite(30, FontWeight.bold),
              ),
              SizedBox(
                height: 40.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTFF(
                      hintText: 'Username',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.mainWhiteColor,
                      ),
                      validate: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      controller: _userNameController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomTFF(
                      hintText: 'Email',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.mainWhiteColor,
                      ),
                      validate: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomTFF(
                      hintText: 'Mobile Number',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColors.mainWhiteColor,
                      ),
                      validate: (phone) {
                        if (phone == null || phone.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomTFF(
                      hintText: 'Password',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.mainWhiteColor,
                      ),
                      validate: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: _passController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                buttonAction: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  }
                },
                buttonText: 'SIGN UP',
                buttonStyle: AppTextStyles.cairoWhite(18.sp, FontWeight.w600),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    style: AppTextStyles.cairoGrey(14, FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    child: Text(
                      "SIGN IN",
                      style: AppTextStyles.cairoYellow(16, FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
