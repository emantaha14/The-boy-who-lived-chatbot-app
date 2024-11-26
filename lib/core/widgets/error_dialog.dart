import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter_chat_bot/core/widgets/default_sized_box.dart';
import 'package:lottie/lottie.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorDialog({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
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
          DefaultSizedBox.vertical(30.h),
          Text(
            errorMessage == 'Invalid Credentials'
                ? 'Invalid email or password!'
                : '$errorMessage!',
            style: TextStyle(color: Colors.red[700], fontSize: 20),
          ),
          DefaultSizedBox.vertical(10.h),
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
  }
}
