import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/app/app_prefs.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/pages/chats_screen.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/cubit/login_cubit.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/pages/signup_screen.dart';

import '../../../../core/app/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../home/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppPrefs _appPrefs = sl<AppPrefs>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffE9E6E2),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Text(
                  'SIGN IN',
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
                BlocConsumer<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      _appPrefs
                          .setToken(state.loginResponse.accessToken)
                          .then(
                            (value) {
                          final token = _appPrefs.getToken();
                          print(token);
                        },
                      );
                    } else if (state is LoginError) {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    }
                    return Container();
                  },
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatsScreen(),
                          ));
                    }
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
                CustomButton(
                  buttonAction: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                          _userNameController.text, _passController.text);
                    }
                  },
                  buttonText: 'SIGN IN',
                  buttonStyle: AppTextStyles.cairoWhite(18.sp, FontWeight.w600),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?  ",
                      style: AppTextStyles.cairoGrey(14, FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: Text(
                        "SIGN UP",
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
