import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignupTextFields extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController passController;

  const SignupTextFields(
      {super.key,
      required this.userNameController,
      required this.emailController,
      required this.fullNameController,
      required this.passController});

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
        DefaultSizedBox.vertical(25.h),
        CustomTFF(
          hintText: 'Email',
          kbType: TextInputType.text,
          prefixIcon: const Icon(
            Icons.email,
            color: AppColors.mainGreyColor,
          ),
          validate: (email) {
            if (email == null || email.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          controller: emailController,
        ),
        DefaultSizedBox.vertical(25.h),
        CustomTFF(
          hintText: 'Full Name',
          kbType: TextInputType.text,
          prefixIcon: const Icon(
            Icons.drive_file_rename_outline,
            color: AppColors.mainGreyColor,
          ),
          validate: (phone) {
            if (phone == null || phone.isEmpty) {
              return 'Please enter your mobile number';
            }
            return null;
          },
          controller: fullNameController,
        ),
        DefaultSizedBox.vertical(25.h),
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
