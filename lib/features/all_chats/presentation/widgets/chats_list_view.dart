import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/pages/home_screen.dart';
import '../cubit/chats_cubit.dart';

class ChatsListView extends StatelessWidget {
  final dynamic state;

  const ChatsListView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, chatState) {
        final selectedIndex = context.read<ChatsCubit>().selectedIndex;
        return state.chatsResponse.length == 0
            ? Center(
                child: Text(
                  'There is no started chats yet',
                  style:
                      TextStyle(color: AppColors.primaryColor,fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                itemCount: state.chatsResponse.length,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context.read<ChatsCubit>().changeSelectedIndex(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              sessionId: state.chatsResponse[index].sessionId,
                              selectedIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(color: AppColors.primaryColor),
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            state.chatsResponse[index].name,
                            style:
                                AppTextStyles.cairoBlack(18.sp, FontWeight.w600)
                                    .copyWith(
                              color: isSelected
                                  ? AppColors.mainWhiteColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
