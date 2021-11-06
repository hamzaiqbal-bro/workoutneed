import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/ui/video_module/browsing.dart';
import 'home_body.dart';
import '../market/market_body.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var _bottomNavIndex = 0;

  List<Widget> bottomNavList = <Widget>[
    MainProfileDashboard(),
    BrowsingScreen(),
    MarketBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavList.elementAt(_bottomNavIndex),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            child: _buildGNav(),
          )),
    );
  }

  GNav _buildGNav() {
    return GNav(
      gap: 5,
      activeColor: Colors.white,
      iconSize: 20,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      duration: Duration(milliseconds: 800),
      tabBackgroundColor: AppColors.kPrimaryTwo,
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Home",
        ),
        GButton(
          icon: Icons.video_collection_rounded,
          text: "Videos",
        ),
        GButton(
          icon: Icons.shopping_basket_sharp,
          text: "Market",
        ),
      ],
      selectedIndex: _bottomNavIndex,
      onTabChange: (index) {
        _onItemTapped(index);
      },
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
      // if(index == 2){
      //   _scaffoldKey.currentState!.openDrawer();
      // }else{
      //   _bottomNavIndex = index;
      // }
    });
  }

}
