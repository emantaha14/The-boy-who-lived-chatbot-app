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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Stack(
        children: [
          SizedBox(
            width: 370.w,
            child: TextField(
              controller: messageController,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type your message...',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.only(
                    top: 15.h, bottom: 15.h, right: 60.0.w, left: 20.w),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            right: 10.w,
            child: InkWell(
              onTap: sendMessage,
              child: CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primaryColor,
                child: Image.asset(
                  AppImages.sendImage,
                  color: Colors.white,
                  width: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
