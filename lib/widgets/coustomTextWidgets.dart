
import 'package:flutter/cupertino.dart';
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

  static Widget centeredText(String text, double fontSize, Color textColor,FontWeight fontWeight) {
    return Text(
      text != null ? text : "",
      overflow: TextOverflow.fade,
      softWrap: true,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
      textAlign: TextAlign.center,
    );
  }

  static Widget defaultText(String text, TextStyle textStyle, TextAlign _textAlign) {
    return Text(
      text != null ? text : "",
      style: textStyle,
      textAlign: _textAlign,
    );
  }

  static Widget detailsText(String text, TextStyle textStyle) {
    return Text(
      text != null ? text : "",
      textAlign: TextAlign.start,
      softWrap: true,
      maxLines: 3,
      style: textStyle,
    );
  }

}
