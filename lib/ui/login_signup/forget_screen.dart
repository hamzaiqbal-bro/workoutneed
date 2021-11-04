import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/login_signup/confirm_reset_password.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/form_field_widget.dart';
import 'package:workour/widgets/button_widgets.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

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
                              'Enter Email',
                              'Email',
                              Icons.email,
                              email,
                              TextInputType.emailAddress,
                              true
                          ),

                          SizedBox(height: AppStyles.fifteennumber,),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmResetPassword()));
                              },
                              child: ButtonWidgets.coustomButton('Send Code',16.0,FontWeight.bold,context)),
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
