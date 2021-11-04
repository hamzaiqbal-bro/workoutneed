import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/ui/video_module/channel_tabs/stores.dart';
import 'package:workour/ui/video_module/channel_tabs/playlist.dart';
import 'package:workour/ui/video_module/channel_tabs/premium_content.dart';
import 'package:workour/ui/video_module/channel_tabs/video.dart';
import 'package:workour/widgets/custom_text_widgets.dart';

class ChannelTabs extends StatefulWidget {
  const ChannelTabs({Key? key}) : super(key: key);

  @override
  _ChannelTabsState createState() => _ChannelTabsState();
}

class _ChannelTabsState extends State<ChannelTabs> {
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
                        CustomTextWidgets.customText( 'Vedio',12.0,AppColors.backgroundGrey,FontWeight.bold),
                        CustomTextWidgets.customText( 'Playlist',12.0,AppColors.backgroundGrey,FontWeight.bold),
                        CustomTextWidgets.customText( 'Premium',12.0,AppColors.backgroundGrey,FontWeight.bold),
                        CustomTextWidgets.customText( 'Store',12.0,AppColors.backgroundGrey,FontWeight.bold),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              new VideoTab(),
              PlayList(),
              PremiumContent(),
              Stores(),
            ],
          ),
        ),
      ),
    );
  }
}
