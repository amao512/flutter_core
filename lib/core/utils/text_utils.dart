import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

double getTextSize(String text, TextStyle? textStyle, BuildContext context) {
  var height = (TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: Device.screenWidth - 32))
      .size
      .height;
  return height;
}