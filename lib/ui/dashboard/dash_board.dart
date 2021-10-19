import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/ui/dashboard/video_body.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/statefulWidgets.dart';
import 'home_body.dart';
import 'market_body.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var _bottomNavIndex = 0;

  List<Widget> bottomNavList = <Widget>[
    HomeBody(),
    VideoBody(),
    MarketBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryTwo,
        elevation: 0,
        actions: [
          IconButton(
              padding: EdgeInsets.all(5.0),
              onPressed: null,
              icon: IconWidgets.customIcon(Icons.notifications, Colors.white))
        ],
      ),
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
          icon: Icons.favorite,
          text: "Videos",
        ),
        GButton(
          icon: Icons.shopping_basket,
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
