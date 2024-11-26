import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_colors.dart';
import 'package:harry_potter_chat_bot/core/theme/app_images.dart';

class ChatTextField extends StatelessWidget {
  final void Function()? sendMessage;
  final TextEditingController messageController;

  const ChatTextField(
      {super.key, required this.sendMessage, required this.messageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 370.w,
          child: TextField(
            controller: messageController,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.txtFieldFillColor,
              hintText: 'Type your message...',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 20.0.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey[400] ?? Colors.transparent),
                borderRadius: BorderRadius.circular(50.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.txtFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 15,
          child: InkWell(
            onTap: sendMessage,
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.mainRedColor,
              child: Image.asset(
                AppImages.sendImage,
                color: Colors.white,
                width: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}