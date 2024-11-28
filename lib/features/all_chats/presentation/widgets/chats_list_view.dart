import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

        print(selectedIndex);
        return ListView.builder(
          itemCount: state.chatsResponse.length,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            print(isSelected);
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
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.mainRedColor),
                    color: isSelected
                        ? AppColors.mainRedColor
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      state.chatsResponse[index].name,
                      style: AppTextStyles.cairoBlack(18, FontWeight.w600)
                          .copyWith(
                        color: isSelected
                            ? AppColors.mainWhiteColor
                            : Colors.grey[700],
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
