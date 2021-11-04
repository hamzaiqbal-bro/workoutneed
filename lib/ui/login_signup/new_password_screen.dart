import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/login_signup/login_signup.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/form_field_widget.dart';
import 'package:workour/widgets/button_widgets.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundGrey,
          alignment: Alignment.center,
          child:   Padding(
            padding: EdgeInsets.all(AppStyles.teennumber),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: width,
              child: Padding(
                padding: EdgeInsets.all(AppStyles.fifteennumber),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: CustomTextWidgets.customText('Reset Password',19.0,AppColors.kPrimaryTwo,FontWeight.bold)),
                    Expanded(child: Column(
                      children: [
                        InputField(
                            'next',
                            'Enter password',
                            'password',
                            Icons.remove_red_eye,
                            email,
                            TextInputType.emailAddress,
                            true
                        ),

                        SizedBox(height: AppStyles.fifteennumber,),

                        InputField(
                            'next',
                            'confirm password',
                            'confirm Password',
                            Icons.remove_red_eye,
                            email,
                            TextInputType.emailAddress,
                            true
                        ),

                        SizedBox(height: AppStyles.fifteennumber,),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUp()));
                            },
                            child: ButtonWidgets.coustomButton('Change Password',16.0,FontWeight.bold,context)),
                      ],
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
