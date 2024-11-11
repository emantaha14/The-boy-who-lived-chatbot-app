import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/networking/api_services.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/cubit/chats_cubit.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/pages/login_screen.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:harry_potter_chat_bot/oop.dart';
import 'core/app/di.dart' as di;
import 'core/app/di.dart';
import 'features/all_chats/presentation/pages/chats_screen.dart';
import 'features/login/presentation/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  ApiServices.init();
  runApp(const MyApp());

  Adder add = Adder();
  add.add(2, 4);
  MyBook myBook = MyBook();
  myBook.setTitle('s');
  myBook.getTitle();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(loginUseCase: sl()),
          ),
          BlocProvider(
            create: (context) => SignupCubit(signupUseCase: sl()),
          ),
          BlocProvider(
            create: (context) => ChatsCubit(chatsUseCase: sl())..getAllChats(),
          ),
          BlocProvider(
            create: (context) => CreateChatCubit(createChatUseCase: sl()),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ChatsScreen(),
        ),
      ),
    );
  }
}

