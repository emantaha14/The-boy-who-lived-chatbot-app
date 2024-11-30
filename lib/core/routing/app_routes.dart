import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/features/all_chats/presentation/pages/chats_screen.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/pages/login_screen.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/pages/signup_screen.dart';

import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';
import '../app/di.dart';

class Routes {
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String chatsRoute = '/Chats';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(loginUseCase: sl()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => SignupCubit(signupUseCase: sl()),
              child: const SignUpScreen()),
        );
      case Routes.chatsRoute:
        return MaterialPageRoute(
          builder: (context) => const ChatsScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
