import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';

class DecoratedContainerWidgets{
  DecoratedContainerWidgets._();

  static Widget decoratedContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.kPrimaryTwo, spreadRadius: 1.5),
        ],
      ),
      child: child,
    );
  }

  static Widget simpleContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: child,
    );
  }

  static Widget circularContainer(Color bgColor, Color iconColor, IconData iconData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(iconData, color: iconColor, size: 30.0,),
      ),
    );
  }

  static Widget messagingContainer(Color borderColor, Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: borderColor, width: 1.5),
        color: Colors.white,
      ),
      child: child,
    );
  }

}