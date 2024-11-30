import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/core/theme/app_colors.dart';
import 'package:harry_potter_chat_bot/core/widgets/error_dialog.dart';
import '../../../home/pages/home_screen.dart';
import '../cubit/chats_cubit.dart';
import 'create_chat_dialog.dart';

class DefaultFloatingActionButton extends StatelessWidget {
  DefaultFloatingActionButton({super.key});

  final GlobalKey<FormState> formChatKey = GlobalKey<FormState>();
  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return BlocListener<CreateChatCubit, ChatsState>(
              listener: (context, state) {
                if (state is CreateChatSuccessState) {
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          sessionId: state.createChatResponse.sessionId,
                          selectedIndex:
                              context.read<ChatsCubit>().selectedIndex + 1,
                        ),
                      ));
                } else if (state is CreateChatsErrorState) {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ErrorDialog(
                        errorMessage: state.failure.message,
                      );
                    },
                  );
                }
              },
              child: CreateChatDialog(
                formChatKey: formChatKey,
                chatController: chatController,
                onPressed: () {
                  if (formChatKey.currentState!.validate()) {
                    context
                        .read<CreateChatCubit>()
                        .createChat(chatController.text);
                  }
                },
              ),
            );
          },
        );
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: AppColors.mainWhiteColor,
      ),
    );
  }
}
