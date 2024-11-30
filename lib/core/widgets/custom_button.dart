import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonText,
    required this.buttonAction,
    this.buttonStyle,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.elevation,
    this.widget,
  });

  factory CustomButton.notFilled({
    String? buttonText,
    required void Function() buttonAction,
    TextStyle? buttonStyle,
    required Color borderColor,
    double? height,
    double? width,
    Widget? widget,
    double? elevation,
    double? borderRadius,
  }) {
    return CustomButton(
      buttonAction: buttonAction,
      buttonText: buttonText,
      buttonStyle: buttonStyle,
      height: height,
      width: width,
      borderRadius: borderRadius,
      color: Colors.white,
      borderColor: borderColor,
      elevation: elevation,
      widget: widget,
    );
  }

  final String? buttonText;
  final TextStyle? buttonStyle;
  final void Function() buttonAction;
  final double? height;
  final double? width;
  final double? elevation;
  final double? borderRadius;
  final Color? color;
  final Widget? widget;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    assert(buttonText != null || widget != null);
    assert((widget != null && (buttonText != null || buttonStyle != null)) !=
        true);
    if (buttonText != null) {
      assert(buttonStyle != null);
    }
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 40.h,
      child: MaterialButton(
        elevation: elevation ?? 4.0,
        onPressed: buttonAction,
        padding: EdgeInsets.zero,
        color: color ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        child: Center(
          child: widget ??
              Text(
                buttonText!,
                style: buttonStyle,
              ),
        ),
      ),
    );
  }
}
