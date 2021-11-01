import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/vedioModule/channelTabs/channelTabs.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';

class ProfilePlusVedio extends StatefulWidget {
  const ProfilePlusVedio({Key? key}) : super(key: key);

  @override
  _ProfilePlusVedioState createState() => _ProfilePlusVedioState();
}

class _ProfilePlusVedioState extends State<ProfilePlusVedio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        height:120.0,
                        alignment: Alignment.topCenter,
                        child: ImageWidgets.customImageWidgets(imageAssets.backGroundImage)),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
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
                              ]),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ImageWidgets.circularImage(imageAssets.personImages, 40.0, 40.0),
                              ],
                            )

                        )),
                  ],
                ),
              ),
              CustomTextWidgets.customText( 'Lorem Ipsum',16.0,AppColors.darkBlack,FontWeight.bold),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomTextWidgets.customText( '148K',14.0,AppColors.darkBlack,FontWeight.bold),
                      CustomTextWidgets.customText( 'Subscribe',14.0,AppColors.backgroubdGrye,FontWeight.bold),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    height: 50.0,
                    color: AppColors.kPrimaryTwo,
                    width: 3.0,
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    children: [
                      CustomTextWidgets.customText( '18K',14.0,AppColors.darkBlack,FontWeight.bold),
                      CustomTextWidgets.customText( 'Vedios',14.0,AppColors.backgroubdGrye,FontWeight.bold),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    height: 50.0,
                    width: 3.0,
                    color: AppColors.kPrimaryTwo,
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    children: [
                      CustomTextWidgets.customText( 'Jan 2000',14.0,AppColors.darkBlack,FontWeight.bold),
                      CustomTextWidgets.customText( 'Joined',14.0,AppColors.backgroubdGrye,FontWeight.bold),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppStyles.fifteennumber,),
              Padding(
                  padding:EdgeInsets.all(20.0),
                  child: ButtonWidgets.whiteTextButton('Subscribe',16.0,FontWeight.bold,context)),

              channelTabs()


            ],
          ),
        ),
      ),
    );
  }
}
