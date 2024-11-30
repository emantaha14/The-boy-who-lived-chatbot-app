import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/cubit/login_cubit.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/widgets/login_bloc_consumer.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/widgets/register_title.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/background_image.dart';
import '../widgets/have_no_account_row.dart';
import '../widgets/login_text_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultSizedBox.vertical(120.h),
              const RegisterTitle(txt: 'SIGN IN'),
              DefaultSizedBox.vertical(40.h),
              Form(
                key: _formKey,
                child: LoginTextFields(
                  passController: passController,
                  userNameController: userNameController,
                ),
              ),
              LoginBlocConsumer(),
              DefaultSizedBox.vertical(50.h),
              CustomButton(
                color: AppColors.primaryColor,
                buttonAction: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<LoginCubit>()
                        .login(userNameController.text, passController.text);
                  }
                },
                buttonText: 'SIGN IN',
                buttonStyle: AppTextStyles.cairoWhite(20.sp, FontWeight.w600),
              ),
              DefaultSizedBox.vertical(20.h),
              const HaveNoAccountRow(),
            ],
          ),
        ),
      ),
    );
  }
}
