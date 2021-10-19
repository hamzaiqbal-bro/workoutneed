
import 'package:flutter/material.dart';

class coustomTextWidgets {
  coustomTextWidgets._();

  static Widget coustomText(String text, double fontSize, Color textColor,FontWeight fontWeight) {
    return Text(
      text != null ? text : "",
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: true,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }

}
