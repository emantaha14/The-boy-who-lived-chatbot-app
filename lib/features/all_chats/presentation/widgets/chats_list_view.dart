import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/pages/home_screen.dart';

class ChatsListView extends StatefulWidget {
  final state;

  const ChatsListView({super.key, required this.state});

  @override
  State<ChatsListView> createState() => _ChatsListViewState();
}

class _ChatsListViewState extends State<ChatsListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.chatsResponse.length,
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
                      sessionId: widget.state.chatsResponse[index].sessionId,
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
                  widget.state.chatsResponse[index].name,
                  style: AppTextStyles.cairoBlack(18, FontWeight.w600).copyWith(
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
}
