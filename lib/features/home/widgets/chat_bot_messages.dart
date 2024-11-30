import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_colors.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';

class ChatBotMessages extends StatelessWidget {
  final ScrollController scrollController;
  final List<Map<String, String>> receivedMessages;

  const ChatBotMessages(
      {super.key,
      required this.scrollController,
      required this.receivedMessages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      itemCount: receivedMessages.length,
      itemBuilder: (context, index) {
        final messageData = receivedMessages[index];
        final decodeMessageData = jsonDecode(messageData['message']!);
        Map<String, dynamic> decodeMessageDataDecoded =
            jsonDecode(decodeMessageData);
        return LayoutBuilder(
          builder: (context, constraints) {
            double maxMessageWidth = constraints.maxWidth / 1.3;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment:
                    decodeMessageDataDecoded['sender'] == 'SYSTEM'
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                children: [
                  decodeMessageDataDecoded['sender'] == 'SYSTEM'
                      ? ClipOval(
                          child: Image.network(
                            "https://img.freepik.com/premium-photo/cute-harry-potter-cartoon_634278-18356.jpg",
                            width: 40.w,
                            height: 30.h,
                            fit: BoxFit.fill,
                          ),
                        )
                      : const SizedBox.shrink(),
                  DefaultSizedBox.horizontal(5.w),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: maxMessageWidth,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: decodeMessageDataDecoded['sender'] == 'USER'? AppColors.primaryColor : AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                        bottomRight:
                            decodeMessageDataDecoded['sender'] == 'SYSTEM'
                                ? Radius.circular(30.r)
                                : Radius.zero,
                        bottomLeft: decodeMessageDataDecoded['sender'] == 'USER'
                            ? Radius.circular(30.r)
                            : Radius.zero,
                      ),
                    ),
                    child: Text(
                      decodeMessageDataDecoded['message'].toString().trim(),
                      style: TextStyle(color: decodeMessageDataDecoded['sender'] == 'USER'? Colors.white : Colors.black, fontSize: 15.sp),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
