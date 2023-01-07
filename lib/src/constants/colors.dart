import 'package:flutter/widgets.dart';

class AppColor {
  AppColor._();
  static const Color black = Color(0xFF1F2C34);
  static const Color grey = Color(0xFF899AA4);
  static const Color green1 = Color(0xFF00A884);
  static const Color green2 = Color(0xFF015C4B);
  static const Color green3 = Color(0xFF044949);
  static const Color green4 = Color(0xFF17504A);
  static const Color blue = Color(0xFF34B7F1);
  static const Color yellow = Color(0xFFFFEA00);
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );
}
