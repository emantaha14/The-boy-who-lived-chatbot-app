import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?  ",
          style: AppTextStyles.cairoGrey(14, FontWeight.w400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Text(
            "SIGN IN",
            style: AppTextStyles.cairoRed(16, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
