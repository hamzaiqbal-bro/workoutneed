import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/image_widgets.dart';

class DefIconTextButton extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData iconData;
  final VoidCallback onPress;

  DefIconTextButton({required this.text, required this.fontSize, required this.fontWeight, required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: RaisedButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                  colors: [
                    AppColors.kPrimaryOne.withOpacity(0.8),
                    AppColors.kPrimaryTwo,
                  ],
                  stops: [
                    0.0,
                    0.6
                  ]
              ),
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidgets.sizedIcon(iconData, Colors.white, 30.0),
                SizedBox(width: 10.0),
                CustomTextWidgets.customText(text, fontSize, AppColors.whiteColor, fontWeight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DefImageTextButton extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final String imageUrl;
  final VoidCallback onPress;

  DefImageTextButton({required this.text, required this.fontSize, required this.fontWeight, required this.imageUrl, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: RaisedButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidgets.customImageWidgets(imageUrl),
                ),
                SizedBox(width: 5.0),
                CustomTextWidgets.customText(text, fontSize, AppColors.black[100]!, fontWeight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyIconTextButton extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData iconData;
  final double iconSize;
  final MainAxisAlignment alignment;
  final VoidCallback onPress;

  MyIconTextButton({required this.text, required this.fontSize, required this.fontWeight, required this.iconData, required this.iconSize, required this.alignment, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: RaisedButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                IconWidgets.sizedIcon(iconData, AppColors.kPrimaryTwo, iconSize),
                SizedBox(width: 10.0),
                CustomTextWidgets.customText(text, fontSize, AppColors.kPrimaryTwo, fontWeight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
