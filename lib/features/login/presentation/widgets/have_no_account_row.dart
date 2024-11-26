import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../signup/presentation/pages/signup_screen.dart';

class HaveNoAccountRow extends StatelessWidget {
  const HaveNoAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?  ",
          style: AppTextStyles.cairoGrey(14, FontWeight.w400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ));
          },
          child: Text(
            "SIGN UP",
            style: AppTextStyles.cairoRed(16, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
