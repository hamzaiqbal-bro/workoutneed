import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/ui/vedioModule/premium_video_payment_method.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/decoratedContainerWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class VideoPremium extends StatefulWidget {
  const VideoPremium({Key? key}) : super(key: key);

  @override
  _VideoPremiumState createState() => _VideoPremiumState();
}

class _VideoPremiumState extends State<VideoPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImageWidgets.coustomImageWidget(imageAssets.premiumBackgroundImage, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
              ImageWidgets.coustomImageWidget(imageAssets.premiumBackground, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () {}),
                        CustomTextWidgets.customText("Go Premium", 16.0, Colors.white, FontWeight.bold)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: CustomTextWidgets.centeredText("Get Access to unlimited content of the world top class fitness trainer", 12.0, Colors.white, FontWeight.normal),
                    ),
                    DecoratedContainerWidgets.mainContainer(
                      MediaQuery.of(context).size.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                              child: ImageWidgets.coustomImageWidget(imageAssets.premiumPlanImage, 150.0, double.infinity)),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidgets.customText("\$${399.9}/", 20.0, AppColors.kPrimaryTwo, FontWeight.bold),
                              CustomTextWidgets.customText("3 months", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidgets.circularAvatar(Icons.check, AppColors.kPrimaryTwo, 20.0, 20.0, Colors.white, Colors.white),
                              CustomTextWidgets.customText("Free Chat and messages", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidgets.circularAvatar(Icons.check, AppColors.kPrimaryTwo, 20.0, 20.0, Colors.white, Colors.white),
                              CustomTextWidgets.customText("Free Chat and messages", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidgets.circularAvatar(Icons.check, AppColors.kPrimaryTwo, 20.0, 20.0, Colors.white, Colors.white),
                              CustomTextWidgets.customText("Free Chat and messages", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidgets.circularAvatar(Icons.check, AppColors.kPrimaryTwo, 20.0, 20.0, Colors.white, Colors.white),
                              CustomTextWidgets.customText("Free Chat and messages", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidgets.circularAvatar(Icons.check, AppColors.kPrimaryTwo, 20.0, 20.0, Colors.white, Colors.white),
                              CustomTextWidgets.customText("Free Chat and messages", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          InkWell(
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                child: ButtonWidgets.coustomButton("Start Plan", 20.0, FontWeight.bold, context)),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => PremiumVideoPaymentMethod()));
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomTextWidgets.centeredText(StringAssets.loremIpsumSmallText, 14.0, Colors.white, FontWeight.bold),
                    ),
                    SizedBox(height: 20.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
