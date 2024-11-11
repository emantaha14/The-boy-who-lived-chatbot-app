import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/pages/login_screen.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:lottie/lottie.dart';

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
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E6E2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140.h,
              ),
              Text(
                'SING UP',
                style: AppTextStyles.cairoRed(30, FontWeight.bold),
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
                        color: AppColors.mainGreyColor,
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
                        color: AppColors.mainGreyColor,
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
                      hintText: 'Full Name',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.drive_file_rename_outline,
                        color: AppColors.mainGreyColor,
                      ),
                      validate: (phone) {
                        if (phone == null || phone.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      controller: _fullNameController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomTFF(
                      hintText: 'Password',
                      kbType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.mainGreyColor,
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
              BlocListener<SignupCubit, SignupState>(
                child: Container(),
                listener: (context, state) {
                  if (state is SignupSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  }
                  else if (state is SignupError){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(
                                'assets/images/owl_error.json',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 30),
                              Text(
                                state.failure.message == 'Invalid Credentials'? 'Invalid email or password!' : '${state.failure.message}!',
                                style:  TextStyle(color: Colors.red[700], fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color:  Colors.black87)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: const Text('OK', style:  TextStyle(color: Colors.black87),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                buttonAction: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signup(
                        _userNameController.text,
                        _passController.text,
                        _fullNameController.text,
                        _emailController.text);
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
                      style: AppTextStyles.cairoRed(16, FontWeight.w500),
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
