import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CreateChatDialog extends StatelessWidget {
  final GlobalKey<FormState> formChatKey;
  final void Function() onPressed;
  final TextEditingController chatController;

  const CreateChatDialog(
      {super.key, required this.formChatKey, required this.onPressed, required this.chatController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 300.w,
        height: 170.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Enter chat name please',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainRedColor),
            ),
            DefaultSizedBox.vertical(16.h),

            // TextFormField
            Form(
              key: formChatKey,
              child: CustomTFF(
                hintText: 'Chat Name',
                kbType: TextInputType.text,
                outlineColor: Colors.grey,
                controller: chatController,
                validate: (chatName) {
                  if (chatName == null || chatName.isEmpty) {
                    return 'Enter chat name please';
                  }
                },
              ),
            ),
            const SizedBox(height: 24),

            // Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  width: 50,
                  height: 30,
                  buttonAction: onPressed,
                  buttonText: 'Done',
                  buttonStyle: const TextStyle(color: AppColors.mainRedColor),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomButton(
                  width: 50,
                  height: 30,
                  buttonAction: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Close',
                  buttonStyle: const TextStyle(color: AppColors.mainWhiteColor),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
