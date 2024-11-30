import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginTextFields extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passController;

  const LoginTextFields(
      {super.key,
      required this.passController,
      required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: userNameController,
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
          controller: passController,
        ),
      ],
    );
  }
}
