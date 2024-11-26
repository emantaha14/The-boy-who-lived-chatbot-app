import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class RegisterTitle extends StatelessWidget {
  final String txt;
  const RegisterTitle({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return   Text(
      txt,
      style: AppTextStyles.cairoRed(30, FontWeight.bold),
    );
  }
}
