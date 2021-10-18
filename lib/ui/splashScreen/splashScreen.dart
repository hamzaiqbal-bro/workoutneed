import 'dart:async';
import 'package:workour/ui/loginSignUp/loginSignUp.dart';
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginSignUp())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  AppColors.kPrimaryOne.withOpacity(0.8),
                  AppColors.kPrimaryTwo,
                ],
                stops: [
                  0.0,
                  0.7
                ]),
        ),
        child: Image.asset(imageAssets.applogo,
        ),
      ),
    );
  }
}
