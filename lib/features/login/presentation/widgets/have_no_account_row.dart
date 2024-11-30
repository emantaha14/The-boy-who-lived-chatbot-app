import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/routing/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';

class HaveNoAccountRow extends StatelessWidget {
  const HaveNoAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?  ",
          style: AppTextStyles.cairoGrey(14.sp, FontWeight.w400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signupRoute);
          },
          child: Text(
            "SIGN UP",
            style: AppTextStyles.cairoBlue(15.sp, FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
