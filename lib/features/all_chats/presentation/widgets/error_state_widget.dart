import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/default_sized_box.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorText;
  final void Function()? onPressed;

  const ErrorStateWidget(
      {super.key, required this.errorText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/images/owl_error.json',
            width: 200,
            height: 150,
            fit: BoxFit.cover,
          ),
          DefaultSizedBox.vertical(30.h),
          Text(
            errorText == 'Invalid Credentials'
                ? 'Invalid email or password!'
                : '$errorText!',
            style: TextStyle(color: Colors.red[700], fontSize: 20),
          ),
          DefaultSizedBox.vertical(10.h),
          Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black87)),
            child: TextButton(
              onPressed: onPressed,
              child: const Text(
                'Retry',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
