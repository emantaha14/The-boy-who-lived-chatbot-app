import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomTFF extends StatefulWidget {
  final String hintText;
  final TextInputType kbType;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  const CustomTFF({
    super.key,
    required this.hintText,
    required this.kbType,
    this.controller,
    this.validate,
    this.prefixIcon,
  });

  @override
  State<CustomTFF> createState() => _CustomTFFState();
}

class _CustomTFFState extends State<CustomTFF> {
  bool showPassword = false;
  String content = '';

  @override
  Widget build(BuildContext context) {
    var borderSide =  const BorderSide(
      color: Colors.white,
      width: 1,
    );
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(
          widget.hintText.toLowerCase().contains('password') ||
                  widget.hintText.toLowerCase().contains('email')
              ? 50
              : 15,
        ),
      ],
      enableInteractiveSelection: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.kbType,
      validator: widget.validate,
      obscureText: widget.hintText.toLowerCase().contains('password')
          ? showPassword
              ? false
              : true
          : false,
      obscuringCharacter: '●',
      enabled: true,
      style: AppTextStyles.cairoBlack(15, FontWeight.w500),
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.secondaryGreenColor,
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          content = value;
        });

      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintFadeDuration: const Duration(milliseconds: 100),
        prefixIcon: widget.prefixIcon,
        suffixIcon: tFFIconPosition(),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        hintStyle: AppTextStyles.cairoGrey(16, FontWeight.w400),
        errorStyle: AppTextStyles.cairoBlack(14, FontWeight.w400)
            .copyWith(color: Colors.red[700]),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: borderSide,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: borderSide.copyWith(color: Colors.red[700]),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: borderSide.copyWith(color: Colors.red[700]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: borderSide,
        ),
      ),
    );
  }

  Widget? tFFIconPosition() {
    return widget.hintText.toLowerCase().contains('password')
        ? IconButton(
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              size: 20.r,
              color: AppColors.secondaryGreyColor,
            ),
          )
        : null;
  }
}
