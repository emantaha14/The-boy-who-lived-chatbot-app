import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harry_potter_chat_bot/features/home/widgets/appbar_widget.dart';
import '../../../core/networking/websocket_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebSocketService webSocketService;
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> messages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff262527),
      statusBarIconBrightness: Brightness.light,
    ));
    webSocketService = WebSocketService();
    Map<String, String> headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJraGFsZWQyNDciLCJleHAiOjE3Mjk3NzY4NDB9.OxiolduHtpy6khlj62-A4DXV6rve5WulB-Ff5DJWQJI',
      'Custom-Header': 'value',
    };

    webSocketService
        .connect(
        'ws://20.90.179.54:8000/chats/95b8a4c1-5b9e-483f-ab21-2c34bec031c0/send',
        headers: headers)
        .then((_) {
      setState(() {
        isLoading = false;
      });

      webSocketService.getMessages()?.listen((data) {
        setState(() {
          messages.add({"message": data, "type": "received"});
          _scrollToBottom();
        });
      });
    });
  }

  @override
  void dispose() {
    webSocketService.disconnect();
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    final message = messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add({"message": message, "type": "sent"});
        _scrollToBottom();
      });
      webSocketService.sendMessage(message);
      messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final receivedMessages =
    messages.where((message) => message['type'] == 'received').toList();
    return Scaffold(
        backgroundColor: const Color(0xffE9E6E2),
        appBar: const ChatAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  itemCount: receivedMessages.length,
                  itemBuilder: (context, index) {
                    final messageData = receivedMessages[index];
                    final decodeMessageData =
                    jsonDecode(messageData['message']!);
                    Map<String, dynamic> decodeMessageDataDecoded =
                    jsonDecode(decodeMessageData);
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        double maxMessageWidth = constraints.maxWidth / 1.3;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
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
                                    decodeMessageDataDecoded['sender'] ==
                                        'SYSTEM'
                                        ? const Radius.circular(30)
                                        : Radius.zero,
                                    bottomLeft:
                                    decodeMessageDataDecoded['sender'] ==
                                        'USER'
                                        ? const Radius.circular(30)
                                        : Radius.zero,
                                  ),
                                ),
                                child: Text(
                                  decodeMessageDataDecoded['message'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 370,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffFAF9F6),
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[400] ?? Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff2e2d2f),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 15,
                  child: InkWell(
                    onTap: sendMessage,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/images/send.png',
                        color: Colors.white,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
