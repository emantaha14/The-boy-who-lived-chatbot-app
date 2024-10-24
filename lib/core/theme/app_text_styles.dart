import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'package:flutter/material.dart';


class AppTextStyles {
  static TextStyle setCairoTextStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.cairo(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle cairoBlack(double fontSize, FontWeight fontWeight) {
    return setCairoTextStyle(
      color: AppColors.mainBlackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle cairoWhite(double fontSize, FontWeight fontWeight) {
    return setCairoTextStyle(
      color: AppColors.mainWhiteColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle cairoGrey(double fontSize, FontWeight fontWeight) {
    return setCairoTextStyle(
      color: AppColors.secondaryGreyColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }static TextStyle cairoYellow(double fontSize, FontWeight fontWeight) {
    return setCairoTextStyle(
      color: AppColors.mainYellowColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle cairoRed(double fontSize, FontWeight fontWeight) {
    return setCairoTextStyle(
      color: AppColors.mainRedColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
