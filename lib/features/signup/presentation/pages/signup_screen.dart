import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/theme/app_text_styles.dart';
import 'package:harry_potter_chat_bot/core/widgets/custom_button.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';
import 'package:harry_potter_chat_bot/features/login/presentation/widgets/register_title.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:harry_potter_chat_bot/features/signup/presentation/widgets/signup_text_fields.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/already_have_account_row.dart';
import '../widgets/signup_bloc_listener.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
              const RegisterTitle(txt: 'SIGN UP'),
              DefaultSizedBox.vertical(40.h),
              Form(
                key: _formKey,
                child: SignupTextFields(
                    userNameController: userNameController,
                    emailController: emailController,
                    fullNameController: fullNameController,
                    passController: passController),
              ),
              const SignupBlocListener(),
              DefaultSizedBox.vertical(40.h),
              CustomButton(
                buttonAction: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signup(
                        userNameController.text,
                        passController.text,
                        fullNameController.text,
                        emailController.text);
                  }
                },
                buttonText: 'SIGN UP',
                buttonStyle: AppTextStyles.cairoWhite(20.sp, FontWeight.w600),
              ),
              DefaultSizedBox.vertical(20.h),
              const AlreadyHaveAccountRow(),
            ],
          ),
        ),
      ),
    );
  }
}
