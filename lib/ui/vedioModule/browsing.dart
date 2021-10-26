import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/models/SubscriptionModel.dart';
import 'package:workour/ui/vedioModule/nowPlaying.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';


class browsingScreen extends StatefulWidget {
  const browsingScreen({Key? key}) : super(key: key);

  @override
  _browsingScreenState createState() => _browsingScreenState();
}

class _browsingScreenState extends State<browsingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
               padding: EdgeInsets.all(10.0),
               decoration: BoxDecoration(
                 color: AppColors.whiteColor,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.2),
                     spreadRadius: 2,
                     blurRadius: 5,
                     offset: Offset(0, 3), // changes position of shadow
                   ),
                 ],
               ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageWidgets.circularImage(imageAssets.personImages,40.0,40.0),
                    Container(
                      child: Row(
                        children: [
                          imageWidgets.coustomImageWithHeightWidthWidgets(imageAssets.viewIcon,40.0,40.0),
                          SizedBox(width: 5.0,),
                          imageWidgets.coustomImageWithHeightWidthWidgets(imageAssets.uploadIcon,40.0,40.0),
                          SizedBox(width: 5.0,),
                          imageWidgets.coustomImageWithHeightWidthWidgets(imageAssets.searchIcon,40.0,40.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10.0,),
              Row(
                children: [
                  Container(
                    height: 55.0,
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppColors.kPrimaryTwo,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: coustomTextWidgets.detailsText('Explore', TextStyle(
                                        letterSpacing: 0.05,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                        3
                                    ),
                                  ),

                                  SizedBox(width: 8.0,),

                                  Icon(Icons.ac_unit_sharp,color: AppColors.whiteColor,)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:Container(
                      height: 50.0,
                      child: FutureBuilder(
                        future: readSubscriptionChannelsJSONData(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData){
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext bContext, int index) {
                                  SubscriptionModel notification = snapshot.data[index];
                                  return _buildDNotification(notification,index);
                                });
                          }
                          else if(snapshot.hasError) {
                            return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                          }
                          return CircularProgressIndicator();
                        },

                      ),
                    )
                  )
                ],
              ),
                 Padding(
                     padding: EdgeInsets.all(5.0),
                     child: coustomTextWidgets.coustomText('Trending', 16.0, AppColors.darkBlack, FontWeight.bold)),
              Container(
                height: 120.0,
                child: FutureBuilder(
                  future: readSubscriptionChannelsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            SubscriptionModel notification = snapshot.data[index];
                            return _TrendingPosts(notification);
                          });
                    }
                    else if(snapshot.hasError) {
                      return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              ),

              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: coustomTextWidgets.coustomText('Popular', 16.0, AppColors.darkBlack, FontWeight.bold)),

              Container(
                height: 120.0,
                child: FutureBuilder(
                  future: readSubscriptionChannelsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            SubscriptionModel notification = snapshot.data[index];
                            return _TrendingPosts(notification);
                          });
                    }
                    else if(snapshot.hasError) {
                      return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              ),

              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: coustomTextWidgets.coustomText('Random Tv', 16.0, AppColors.darkBlack, FontWeight.bold)),

              Container(
                child: FutureBuilder(
                  future: readSubscriptionChannelsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            SubscriptionModel notification = snapshot.data[index];
                            return _randomTvDesign(notification);
                          });
                    }
                    else if(snapshot.hasError) {
                      return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
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

  Widget _buildDNotification(SubscriptionModel notification,positon) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Container(
        height: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 5.0, right: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color:  positon == 0 ? AppColors.kPrimaryTwo : AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: coustomTextWidgets.detailsText(notification.channelName, TextStyle(
                            letterSpacing: 0.05,
                            color:positon == 0 ? AppColors.whiteColor : AppColors.black[100],
                            fontWeight: FontWeight.bold
                        ),
                            3
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _TrendingPosts(SubscriptionModel notification) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Stack(
        children: [
          Container(
            width: 170.0,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(notification.channelIcon)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.redAccent,
            ),
          ),

        Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 imageWidgets.circularImage(imageAssets.personImages, 30.0, 30.0),
               ],
             ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  coustomTextWidgets.coustomText('21 Day Sweate', 13.0, AppColors.whiteColor, FontWeight.bold),
                  coustomTextWidgets.coustomText('Logan Brain', 11.0, AppColors.whiteColor, FontWeight.normal),
                ],
              )
            ],
          ),
        )
        ],
      ),
    );
  }

  Widget _randomTvDesign(SubscriptionModel notification) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => nowPlaying()));
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(notification.channelIcon)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    imageWidgets.circularImage(imageAssets.personImages, 30.0, 30.0),
                  ],
                ),

                SizedBox(height: 115.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    coustomTextWidgets.coustomText('21 Day Sweate', 13.0, AppColors.whiteColor, FontWeight.bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        coustomTextWidgets.coustomText('Logan Brain', 11.0, AppColors.whiteColor, FontWeight.normal),
                        coustomTextWidgets.coustomText('5.00', 11.0, AppColors.whiteColor, FontWeight.normal),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
