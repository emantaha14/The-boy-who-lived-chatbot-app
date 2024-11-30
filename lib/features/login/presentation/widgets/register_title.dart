import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';

class RegisterTitle extends StatelessWidget {
  final String txt;

  const RegisterTitle({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style:  TextStyle(
          color: AppColors.primaryColor, fontSize: 34.sp, fontWeight: FontWeight.bold),
      // style: AppTextStyles.cairoRed(30, FontWeight.bold),
    );
  }
}
