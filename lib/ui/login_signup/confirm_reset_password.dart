import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/login_signup/new_password_screen.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/form_field_widget.dart';
import 'package:workour/widgets/button_widgets.dart';

class ConfirmResetPassword extends StatefulWidget {
  const ConfirmResetPassword({Key? key}) : super(key: key);

  @override
  _ConfirmResetPasswordState createState() => _ConfirmResetPasswordState();
}

class _ConfirmResetPasswordState extends State<ConfirmResetPassword> {
  TextEditingController emial = TextEditingController();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidgets.customText('Enter the code that we have sent you on email',14.0,AppColors.kPrimaryTwo,FontWeight.normal),
                        SizedBox(height: AppStyles.teennumber,),
                        InputField(
                            'next',
                            'Enter Code',
                            'Code',
                            Icons.format_list_numbered,
                            emial,
                            TextInputType.emailAddress,
                            true
                        ),

                        SizedBox(height: AppStyles.fifteennumber,),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewPasswordScreen()));
                            },
                            child: ButtonWidgets.coustomButton('Reset Password',16.0,FontWeight.bold,context)),
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
