import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/NotificationsModel.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/image_widgets.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Notifications"),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: FutureBuilder(
                  future: readNotificationsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext bContext, int index) {
                              NotificationsModel notification = snapshot.data[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: ScaleAnimation(
                                    child: _buildDNotification(notification)),
                              );
                            }),
                      );
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDNotification(NotificationsModel notification) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              margin: EdgeInsets.symmetric(vertical: 10.0 ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(notification.image)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 5.0, right: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidgets.detailsText(notification.text, TextStyle(
                          letterSpacing: 0.05,
                          color: Colors.black
                      ),
                      3
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomTextWidgets.defaultText(notification.time, TextStyle(
                            color: AppColors.greyColor,
                        ), TextAlign.start),
                      ),
                    ],
                  )
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 2.0, right: 5.0),
                child: ImageWidgets.circleAvatar(notification.channelIcon, 23.0, 25.0)),
          ],
        ),
      ),
    );
  }
}
