import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workour/AlertDialouges/coustomAlerts.dart';
import 'package:workour/Controllers/loginController.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/image_assets.dart';
import 'package:workour/ui/dashboard/dash_board.dart';
import 'package:workour/ui/login_signup/forget_screen.dart';
import 'package:workour/widgets/button_widgets.dart';
import 'package:workour/widgets/form_field_widget.dart';
import 'package:workour/widgets/image_widgets.dart';
import 'package:workour/widgets/custom_text_widgets.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}


class _loginWidgetState extends State<loginWidget> {

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageWidgets.customImageWidgets(ImageAssets.loginLogo),
        SizedBox(height: AppStyles.fifteennumber,),
        InputField(
            'next',
            'Enter Email',
            'Email',
            Icons.email,
            loginController.emailTextController,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'Enter Password',
            'Password',
            Icons.lock,
            loginController.passwordTextController,
            TextInputType.visiblePassword,
            false
        ),
        SizedBox(height: AppStyles.teennumber,),
        Align(
            alignment: Alignment.centerRight,
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen()));
                },

                child: coustomTextWidgets.coustomText( 'Forget Password',16.0,AppColors.kPrimaryTwo,FontWeight.bold))),
        SizedBox(height: AppStyles.fifteennumber,),
        InkWell(
            onTap: (){
              waitingdialouge(context,'please wait');

             loginController.apiLogin(context);
            },
            child: ButtonWidgets.coustomButton('Login',16.0,FontWeight.bold,context)),
        SizedBox(height: AppStyles.fourtynumber,),
        Align(
            alignment: Alignment.center,
            child: CustomTextWidgets.customText( 'OR',19.0,AppColors.backgroundGrey,FontWeight.bold)),
        SizedBox(height: AppStyles.thirtynumber,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidgets.customImageWidgets(ImageAssets.googleIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(ImageAssets.twitterIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(ImageAssets.facebookIcon),
          ],
        ),
        SizedBox(height: AppStyles.teennumber,),
      ],
    );
  }
}
