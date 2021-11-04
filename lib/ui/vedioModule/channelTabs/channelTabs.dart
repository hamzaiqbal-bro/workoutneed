import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/ui/vedioModule/channelTabs/Stores.dart';
import 'package:workour/ui/vedioModule/channelTabs/playlist.dart';
import 'package:workour/ui/vedioModule/channelTabs/premimumContent.dart';
import 'package:workour/ui/vedioModule/channelTabs/vedio.dart';
import 'package:workour/widgets/customTextWidgets.dart';

class channelTabs extends StatefulWidget {
  const channelTabs({Key? key}) : super(key: key);

  @override
  _channelTabsState createState() => _channelTabsState();
}

class _channelTabsState extends State<channelTabs> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: new Container(
              color: AppColors.whiteColor,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      labelColor: AppColors.kPrimaryTwo,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        CustomTextWidgets.customText( 'Vedio',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                        CustomTextWidgets.customText( 'Playlist',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                        CustomTextWidgets.customText( 'Premium',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                        CustomTextWidgets.customText( 'Store',12.0,AppColors.backgroubdGrye,FontWeight.bold),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              new VedioTab(),
              playList(),
              PremiumContent(),
              stores(),
            ],
          ),
        ),
      ),
    );
  }
}
