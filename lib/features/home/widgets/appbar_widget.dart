import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../all_chats/presentation/cubit/chats_cubit.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;

  const ChatAppBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 23.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.maybePop(context);
                  context.read<ChatsCubit>().getAllChats();
                  context.read<ChatsCubit>().changeSelectedIndex(selectedIndex);
                },
              ),
              const Spacer(),
              Center(
                child: Text(
                  'Harry Potter Chatbot',
                  style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15.r,
                child: Text(
                  '!',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
