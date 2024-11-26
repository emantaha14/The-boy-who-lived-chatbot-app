import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/app/app_prefs.dart';
import '../../../../core/app/di.dart';
import '../../../all_chats/presentation/pages/chats_screen.dart';
import '../cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  final AppPrefs _appPrefs = sl<AppPrefs>();

  LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        print(state);
        if (state is LoginSuccess) {
          _appPrefs.setToken(state.loginResponse.accessToken).then(
            (value) {
              final token = _appPrefs.getToken();
              print(token);
            },
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatsScreen(),
              ));
        } else if (state is LoginError) {
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
                      style: TextStyle(color: Colors.red[700], fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black87)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
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
    );
  }
}
