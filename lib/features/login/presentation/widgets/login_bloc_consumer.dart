import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/routing/app_routes.dart';
import 'package:harry_potter_chat_bot/core/theme/app_images.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/app/app_prefs.dart';
import '../../../../core/app/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  final AppPrefs _appPrefs = sl<AppPrefs>();

  LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          _appPrefs.setToken(state.loginResponse.accessToken);
        }
        return Container();
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, Routes.chatsRoute);
        } else if (state is LoginError) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      AppImages.errorImage,
                      width: 200.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      state.failure.message == 'Invalid Credentials' ||
                              state.failure.message == 'Invalid credentials'
                          ? 'Invalid email or password!'
                          : '${state.failure.message}!',
                      style: TextStyle(color: Colors.red[700], fontSize: 20.sp),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        height: 35.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
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
    );
  }
}
