import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class PaymentConfirm extends StatefulWidget {
  const PaymentConfirm({Key? key, required this.paymentMethod, required this.headingText, required this.detailsText}) : super(key: key);
  final String paymentMethod;
  final String headingText;
  final String detailsText;

  @override
  _PaymentConfirmState createState() => _PaymentConfirmState(paymentMethod: paymentMethod, headingText: headingText, detailsText: detailsText);
}

class _PaymentConfirmState extends State<PaymentConfirm> {

  _PaymentConfirmState({required this.paymentMethod, required this.headingText, required this.detailsText});
  final String paymentMethod;
  final String headingText;
  final String detailsText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(paymentMethod, style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: imageWidgets.coustomImageWidgets(paymentMethod == "JazzCash" ? imageAssets.paymentSuccessImage : imageAssets.paymentFailedImage),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: coustomTextWidgets.customText(headingText, 18.0, AppColors.black[100]!, FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: coustomTextWidgets.centeredText(detailsText, 14.0, AppColors.black[200]!, FontWeight.normal),
            ),
            Visibility(
              visible: paymentMethod != "JazzCash" ? true : false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: buttonWidgets.coustomButton("Okay", 18.0, FontWeight.bold, context),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: buttonWidgets.darkGreyButton("Not Now", 18.0, FontWeight.bold, context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
