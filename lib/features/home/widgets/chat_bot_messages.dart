import 'dart:convert';

import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
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
                            "https://assets-prd.ignimgs.com/2021/01/26/harry-potter-button-1611619333944.jpg",
                            width: 38,
                            height: 38,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: maxMessageWidth,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(30),
                        topLeft: const Radius.circular(30),
                        bottomRight:
                            decodeMessageDataDecoded['sender'] == 'SYSTEM'
                                ? const Radius.circular(30)
                                : Radius.zero,
                        bottomLeft: decodeMessageDataDecoded['sender'] == 'USER'
                            ? const Radius.circular(30)
                            : Radius.zero,
                      ),
                    ),
                    child: Text(
                      decodeMessageDataDecoded['message'],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
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
