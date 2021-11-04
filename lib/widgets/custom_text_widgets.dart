import 'package:flutter/material.dart';
import 'package:workour/constants/app_styles.dart';

class CustomTextWidgets {
  CustomTextWidgets._();

  static Widget appBarTextWidget(String text) {
    return Text(text, style: AppStyles.appBarTextStyle);
  }

  static Widget myCustomText(String text, double fontSize, Color textColor, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    );
  }

  static Widget customText(String text, double fontSize, Color textColor, FontWeight fontWeight) {
    return Text(
      text,
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

  static Widget centeredText(String text, double fontSize, Color textColor, FontWeight fontWeight) {
    return Text(
      text,
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
      text,
      style: textStyle,
      textAlign: _textAlign,
    );
  }

  static Widget detailsText(String text, TextStyle textStyle, int maxLines) {
    return Text(
      text,
      textAlign: TextAlign.start,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: textStyle,
    );
  }

  static Widget customStyledText(String text, double fontSize, Color textColor, FontWeight fontWeight) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      softWrap: true,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    );
  }

}
