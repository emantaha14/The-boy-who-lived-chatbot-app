import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/cubit/chats_cubit.dart';
import 'package:harry_potter_chat_bot/features/home/pages/home_screen.dart';

import '../../../../core/theme/app_colors.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          if (state is ChatsErrorState) {
            return Center(
              child: Text(
                state.toString(),
                style: const TextStyle(color: AppColors.mainRedColor),
              ),
            );
          } else if (state is ChatsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainRedColor,
              ),
            );
          } else if (state is ChatsLoadedState) {
            return ListView.builder(
              itemCount: state.chatsResponse.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    },
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.mainRedColor),
                          color: selectedIndex == index
                              ? AppColors.mainRedColor
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          state.chatsResponse[index].name,
                          style: AppTextStyles.cairoBlack(18, FontWeight.w600)
                              .copyWith(
                                  color: selectedIndex == index
                                      ? AppColors.mainWhiteColor
                                      : Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainRedColor,
        child: const Icon(
          Icons.add,
          color: AppColors.mainWhiteColor,
        ),
      ),
    );
  }
}
