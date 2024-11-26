import 'package:flutter/cupertino.dart';

class DefaultSizedBox extends SizedBox {
  const DefaultSizedBox.vertical(double height, {super.key})
      : super(height: height);

  const DefaultSizedBox.horizontal(double width, {super.key})
      : super(width: width);
}
