import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/cubit/chats_cubit.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/widgets/default_floating_action_button.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/widgets/error_state_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widgets/chats_list_view.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            if (state is ChatsErrorState) {
              return ErrorStateWidget(
                errorText: state.failure.message,
                onPressed: () {
                  context.read<ChatsCubit>().getAllChats();
                },
              );
            } else if (state is ChatsLoadingState) {
              return const LoadingWidget();
            } else if (state is ChatsLoadedState) {
              return ChatsListView(
                state: state,
              );
            }
            return Container();
          },
        ),
        floatingActionButton: DefaultFloatingActionButton());
  }
}
