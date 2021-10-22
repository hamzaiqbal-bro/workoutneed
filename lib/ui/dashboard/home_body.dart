import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/dashboard/downloads.dart';
import 'package:workour/ui/dashboard/notes.dart';
import 'package:workour/ui/dashboard/premium_content.dart';
import 'package:workour/ui/dashboard/profile.dart';
import 'package:workour/ui/dashboard/purchase_products.dart';
import 'package:workour/ui/dashboard/subscription.dart';
import 'package:workour/widgets/cardWidgets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/statefulWidgets.dart';

import 'notifications.dart';

class mainProfileDashboard extends StatefulWidget {
  const mainProfileDashboard({Key? key}) : super(key: key);

  @override
  _mainProfileDashboardState createState() => _mainProfileDashboardState();
}

class _mainProfileDashboardState extends State<mainProfileDashboard> {
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
                    imageWidgets.circularImage(imageAssets.profileImage, 120.0, 120.0),
                    const SizedBox(
                      height: 10.0,
                    ),
                    coustomTextWidgets.coustomText("John Doe", 24.0, Colors.white, FontWeight.bold),
                    const SizedBox(
                      height: 5.0,
                    ),
                    coustomTextWidgets.coustomText("Doejohn1234@gmail.com", 16.0, Colors.white, FontWeight.normal),
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
                          child: CardWidgets.customCardWidget(context, "Download", Icons.download),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                Downloads()));
                          },
                        ),
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Premium Content", Icons.ac_unit_sharp),
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
                            child: CardWidgets.customCardWidget(context, "Purchase", Icons.account_balance_sharp),
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
                          child: CardWidgets.customCardWidget(context, "Notes", Icons.date_range),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                Notes()));
                          },
                        ),
                        InkWell(
                          child: CardWidgets.customCardWidget(context, "Profile", Icons.person),
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
