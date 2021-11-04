import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/image_assets.dart';
import 'package:workour/ui/dashboard/downloads.dart';
import 'package:workour/ui/dashboard/notes.dart';
import 'package:workour/ui/dashboard/premium_content.dart';
import 'package:workour/ui/dashboard/profile.dart';
import 'package:workour/ui/dashboard/purchase_products.dart';
import 'package:workour/ui/dashboard/subscription.dart';
import 'package:workour/widgets/card_widgets.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/image_widgets.dart';
import 'package:workour/widgets/stateful_widgets.dart';

import 'notifications.dart';

class MainProfileDashboard extends StatefulWidget {
  const MainProfileDashboard({Key? key}) : super(key: key);

  @override
  _MainProfileDashboardState createState() => _MainProfileDashboardState();
}

class _MainProfileDashboardState extends State<MainProfileDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryTwo,
        flexibleSpace: Container(
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
        ),
        elevation: 0,
        actions: [
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.notifications, Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
              }
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                //color: AppColors.kPrimaryTwo,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageWidgets.circularImage(ImageAssets.personProfileImage, 120.0, 120.0),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextWidgets.customText("John Doe", 24.0, Colors.white, FontWeight.bold),
                    const SizedBox(
                      height: 5.0,
                    ),
                    CustomTextWidgets.customText("Doejohn1234@gmail.com", 16.0, Colors.white, FontWeight.normal),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Download", Icons.file_download),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                Downloads()));
                          },
                        ),
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Premium Content", CupertinoIcons.money_dollar),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                PremiumContent()));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            child: CardWidgets.customCardWidget(context, "Purchase", Icons.shopping_bag),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseProducts()));
                          },
                        ),
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Channel Subscription", Icons.subscriptions_outlined),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Notes", Icons.note),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                Notes()));
                          },
                        ),
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Profile", CupertinoIcons.profile_circled),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                            },
                        ),
                      ],
                    )
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
