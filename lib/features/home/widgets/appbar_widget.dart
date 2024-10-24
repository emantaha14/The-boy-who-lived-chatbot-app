import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(top: 23),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.maybePop(context);
                },
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'Harry Potter Chatbot',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Text(
                  '!',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
