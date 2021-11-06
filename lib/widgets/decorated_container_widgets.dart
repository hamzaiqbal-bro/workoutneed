import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/icon_widgets.dart';

class DecoratedContainerWidgets{
  DecoratedContainerWidgets._();

  static Widget decoratedContainer(Widget _child) {
    return Container(
        margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.kPrimaryTwo, spreadRadius: 1.5),
        ],
      ),
      child: _child
    );
  }

  static Widget decoratedIconTextContainer(String text, IconData iconData, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.kPrimaryTwo, spreadRadius: 1.5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //SvgPicture.asset(ImageAssets.cameraIcon, color: AppColors.kPrimaryTwo),
          IconWidgets.customIcon(iconData, iconColor),
          SizedBox(width: 10.0),
          Text(text)
        ],
      ),
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

  static Widget mainContainer(double _width, Widget child) {
    return Container(
      width: _width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
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