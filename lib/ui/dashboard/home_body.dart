import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/ui/dashboard/downloads.dart';
import 'package:workour/widgets/cardWidgets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                color: AppColors.kPrimaryTwo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageWidgets.circularImage("assets/images/profile.png", 120.0, 120.0),
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
                        CardWidgets.customCardWidget(context, "Premium Content", Icons.ac_unit_sharp),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CardWidgets.customCardWidget(context, "Purchase", Icons.account_balance_sharp),
                        CardWidgets.customCardWidget(context, "Channel Subscription", Icons.subscriptions_outlined),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CardWidgets.customCardWidget(context, "Notes", Icons.date_range),
                        CardWidgets.customCardWidget(context, "Profile", Icons.person),
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
