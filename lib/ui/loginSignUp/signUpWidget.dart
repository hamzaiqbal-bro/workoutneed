import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';

class signUpWidget extends StatefulWidget {
  const signUpWidget({Key? key}) : super(key: key);

  @override
  _signUpWidgetState createState() => _signUpWidgetState();
}

class _signUpWidgetState extends State<signUpWidget> {
  TextEditingController emial = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InputField(
            'next',
            'Enter Username',
            'Username',
            Icons.account_circle_outlined,
            emial,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),
        InputField(
            'next',
            'Enter Email',
            'Email',
            Icons.email,
            emial,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'Enter Password',
            'Password',
            Icons.remove_red_eye,
            emial,
            TextInputType.visiblePassword,
            true
        ),
        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'confirm password',
            'confirm password',
            Icons.remove_red_eye,
            emial,
            TextInputType.visiblePassword,
            true
        ),
        SizedBox(height: AppStyles.teennumber,),
        Align(
            alignment: Alignment.centerRight,
            child: coustomTextWidgets.coustomText( 'Forget Password',16.0,AppColors.backgroubdGrye,FontWeight.bold)),
        SizedBox(height: AppStyles.fifteennumber,),
        buttonWidgets.coustomButton('Sign Up',16.0,FontWeight.bold,context),
        SizedBox(height: AppStyles.fourtynumber,),
        Align(
            alignment: Alignment.center,
            child: coustomTextWidgets.coustomText( 'OR',19.0,AppColors.backgroubdGrye,FontWeight.bold)),
        SizedBox(height: AppStyles.thirtynumber,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidgets.coustomImageWidgets(imageAssets.googleIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            imageWidgets.coustomImageWidgets(imageAssets.twitterIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            imageWidgets.coustomImageWidgets(imageAssets.facebookIcon),
          ],
        ),
        SizedBox(height: AppStyles.teennumber,),
      ],
    );
  }
}
