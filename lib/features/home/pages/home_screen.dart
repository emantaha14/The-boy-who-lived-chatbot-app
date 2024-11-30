import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/app/app_prefs.dart';
import 'package:harry_potter_chat_bot/core/theme/app_colors.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';
import 'package:harry_potter_chat_bot/features/home/widgets/appbar_widget.dart';
import 'package:harry_potter_chat_bot/features/home/widgets/chat_text_field.dart';
import '../../../core/app/di.dart';
import '../../../core/networking/websocket_service.dart';
import '../../../core/widgets/background_image.dart';
import '../widgets/chat_bot_messages.dart';

class HomeScreen extends StatefulWidget {
  final String sessionId;
  final int selectedIndex;

  const HomeScreen(
      {super.key, required this.sessionId, required this.selectedIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebSocketService webSocketService;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  static final AppPrefs _appPrefs = AppPrefs(sl());
  List<Map<String, String>> messages = [];
  bool isLoading = true;
  bool isTyping = false;

  _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.statusBarColor,
      statusBarIconBrightness: Brightness.light,
    ));
    webSocketService = WebSocketService();
    final token = _appPrefs.getToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Custom-Header': 'value',
    };

    webSocketService
        .connect('ws://20.90.179.54:8000/chats/${widget.sessionId}/send',
            headers: headers)
        .then((_) {
      setState(() {
        isLoading = false;
      });

      webSocketService.getMessages()?.listen(
        (data) {
          setState(
            () {
              messages.add({"message": data, "type": "received"});
              _scrollToBottom();
              isTyping = true;
            },
          );
        },
      );
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

  @override
  Widget build(BuildContext context) {
    final receivedMessages =
        messages.where((message) => message['type'] == 'received').toList();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
            appBar: ChatAppBar(
              selectedIndex: widget.selectedIndex,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: ChatBotMessages(
                        scrollController: scrollController,
                        receivedMessages: receivedMessages,
                      )),
                ),
                ChatTextField(
                  sendMessage: sendMessage,
                  messageController: messageController,
                ),
                DefaultSizedBox.vertical(20.h),
              ],
            )),
      ],
    );
  }
}
