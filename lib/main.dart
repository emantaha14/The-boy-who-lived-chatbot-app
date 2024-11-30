import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/networking/api_services.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/cubit/chats_cubit.dart';
import 'core/app/di.dart' as di;
import 'core/app/di.dart';
import 'core/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 609),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChatsCubit(chatsUseCase: sl())..getAllChats(),
          ),
          BlocProvider(
            create: (context) => CreateChatCubit(createChatUseCase: sl()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
          ),
          title: 'Flutter Demo',
          initialRoute: Routes.loginRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
    );
  }
}
