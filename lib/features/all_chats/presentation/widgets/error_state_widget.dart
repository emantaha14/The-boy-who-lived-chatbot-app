import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_images.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/default_sized_box.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorText;
  final void Function()? onPressed;

  const ErrorStateWidget(
      {super.key, required this.errorText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppImages.errorImage,
            width: 200,
            height: 150,
            fit: BoxFit.cover,
          ),
          DefaultSizedBox.vertical(30.h),
          Text(
            errorText == 'Invalid Credentials'
                ? 'Invalid email or password!'
                : '$errorText!',
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 20),
          ),
          DefaultSizedBox.vertical(10.h),
          Container(
            height: 35.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Colors.black87)),
            child: TextButton(
              onPressed: onPressed,
              child: const Text(
                'Retry',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
