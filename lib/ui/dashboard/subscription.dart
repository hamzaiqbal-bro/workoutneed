import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/models/SubscriptionModel.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Subscription"),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: [
          IconButton(onPressed: null, icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryTwo))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                color: AppColors.backgroubdGrye,
                child: FutureBuilder(
                  future: readSubscriptionChannelsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (mContext, index) {
                            SubscriptionModel subscription = snapshot.data[index];
                            return _buildSubscribeChannels(subscription, index);
                          });
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: CustomTextWidgets.customText("Playlists", 16.0, Colors.black, FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextWidgets.customText("Premium Playlists", 14.0, Colors.black, FontWeight.normal),
              ),
              Container(
                child: FutureBuilder(
                  future: readDownloadsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length > 2 ? 2 : snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            DownloadsModel premiumContent = snapshot.data[index];
                            return _buildPremiumContent(premiumContent);
                          });
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: IconWidgets.sizedIcon(
                      Icons.keyboard_arrow_down_rounded,
                      AppColors.kPrimaryTwo,
                      60.0
                  ),
                  onPressed: () {  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextWidgets.customText("Free Content", 14.0, Colors.black, FontWeight.normal),
              ),
              Container(
                child: FutureBuilder(
                  future: readDownloadsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length > 2 ? 2 : snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            DownloadsModel premiumContent = snapshot.data[index];
                            return _buildPremiumContent(premiumContent);
                          });
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: IconWidgets.sizedIcon(
                      Icons.keyboard_arrow_down_rounded,
                      AppColors.kPrimaryTwo,
                      60.0
                  ),
                  onPressed: () {  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextWidgets.customText("All", 14.0, Colors.black, FontWeight.normal),
              ),
              Container(
                child: FutureBuilder(
                  future: readDownloadsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            DownloadsModel premiumContent = snapshot.data[index];
                            return _buildPremiumContent(premiumContent);
                          });
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscribeChannels(SubscriptionModel subscription, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageWidgets.circularImage(subscription.channelIcon, 80.0, 80.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: index == _selectedIndex ? LinearGradient(
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    colors: [
                      AppColors.kPrimaryOne.withOpacity(0.8),
                      AppColors.kPrimaryTwo,
                    ],
                    stops: [
                      0.0,
                      0.7
                    ]) : null,
                color: index != _selectedIndex ? Colors.white : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomTextWidgets.customText(
                    subscription.channelName,
                    12.0,
                    index == _selectedIndex ? Colors.white : Colors.black,
                    FontWeight.normal),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _buildPremiumContent(DownloadsModel premiumContent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 170.0,
              margin: EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(premiumContent.image)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidgets.detailsText(premiumContent.text, TextStyle(
                          letterSpacing: 0.2,
                          // overflow: TextOverflow.ellipsis,
                          color: Colors.black
                      ),
                      3
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomTextWidgets.defaultText(premiumContent.views, TextStyle(
                            color: AppColors.greyColor
                        ), TextAlign.start),
                      ),
                      Row(
                        children: [
                          ImageWidgets.circularImage(premiumContent.image, 20.0, 20.0),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomTextWidgets.defaultText(premiumContent.channelName, TextStyle(
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w600
                            ), TextAlign.start),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
