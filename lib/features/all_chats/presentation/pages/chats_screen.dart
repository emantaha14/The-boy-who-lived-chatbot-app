import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_text_form_field.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/cubit/chats_cubit.dart';
import 'package:harry_potter_chat_bot/features/home/pages/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/app_colors.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int selectedIndex = -1;
  TextEditingController chatController = TextEditingController();
  final GlobalKey<FormState> _formChatKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E6E2),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          if (state is ChatsErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/images/owl_error.json',
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    state.failure.message == 'Invalid Credentials'
                        ? 'Invalid email or password!'
                        : '${state.failure.message}!',
                    style: TextStyle(color: Colors.red[700], fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black87)),
                    child: TextButton(
                      onPressed: () {
                        context.read<ChatsCubit>().getAllChats();
                      },
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              sessionId: state.chatsResponse[index].sessionId,
                            ),
                          ));
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
                                      : Colors.grey[700]),
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
                              sessionId: state.createChatResponse.sessionId),
                        ));
                  } else if (state is CreateChatsErrorState) {
                    Navigator.pop(context);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(
                                'assets/images/owl_error.json',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 30),
                              Text(
                                state.failure.message == 'Invalid Credentials'
                                    ? 'Invalid email or password!'
                                    : '${state.failure.message}!',
                                style: TextStyle(
                                    color: Colors.red[700], fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xffE9E6E2),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 300.w,
                    height: 160.h,
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
                        const SizedBox(height: 16),

                        // TextFormField
                        Form(
                          key: _formChatKey,
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
                              buttonAction: () {
                                if (_formChatKey.currentState!.validate()) {
                                  context
                                      .read<CreateChatCubit>()
                                      .createChat(chatController.text);
                                }
                              },
                              buttonText: 'Done',
                              buttonStyle: const TextStyle(
                                  color: AppColors.mainRedColor),
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
                              buttonStyle: const TextStyle(
                                  color: AppColors.mainWhiteColor),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.mainRedColor,
        child: const Icon(
          Icons.add,
          color: AppColors.mainWhiteColor,
        ),
      ),
    );
  }
}
