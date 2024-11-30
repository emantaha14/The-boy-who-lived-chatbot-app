import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_images.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../login/presentation/pages/login_screen.dart';
import '../cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      child: Container(),
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushNamed(context, Routes.loginRoute);
        } else if (state is SignupError) {
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
                      state.failure.message == 'Invalid Credentials'
                          ? 'Invalid email or password!'
                          : '${state.failure.message}!',
                      style: TextStyle(color: Colors.red[700], fontSize: 20.sp),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        height: 35,
                        width: 70,
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
