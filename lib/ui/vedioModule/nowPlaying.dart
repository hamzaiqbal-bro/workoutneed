import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/vedioModule/profilePlusVedio.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';



class nowPlaying extends StatefulWidget {
  const nowPlaying({Key? key}) : super(key: key);

  @override
  _nowPlayingState createState() => _nowPlayingState();
}

class _nowPlayingState extends State<nowPlaying> {
  late BetterPlayerController _betterPlayerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer.network(
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                  betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  coustomTextWidgets.coustomText( 'Latest Babar Azam batting Highlights',16.0,AppColors.darkBlack,FontWeight.bold),
                  SizedBox(height: 5.0,),
                  coustomTextWidgets.coustomText( '148K Views 5 hours ago',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                  SizedBox(height: 5.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         children: [
                           Icon(Icons.whatshot,size: 35.0,),
                           coustomTextWidgets.coustomText( '148K',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                         ],
                       ),

                       Column(
                         children: [
                           Icon(Icons.volunteer_activism,size: 35.0,),
                           coustomTextWidgets.coustomText( '18K',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                         ],
                       ),

                       InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePlusVedio()));
                         },
                         child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50.0),
                               gradient: LinearGradient(
                                   begin: FractionalOffset.centerLeft,
                                   end: FractionalOffset.centerRight,
                                   colors: [
                                      AppColors.kPrimaryOne.withOpacity(0.8),
                                     AppColors.kPrimaryTwo,
                                   ],
                                   stops: [
                                     0.0,
                                     0.6
                                   ]),
                             ),
                             child: Padding(
                                 padding: EdgeInsets.all(5.0),
                                 child: Stack(
                                   alignment: Alignment.bottomCenter,
                                   children: [
                                     imageWidgets.circularImage(imageAssets.personImages, 40.0, 40.0),
                                     CircleAvatar(
                                         radius: 8.0,
                                         backgroundColor: AppColors.whiteColor,
                                         child: Align(
                                             alignment: Alignment.center,
                                             child: Icon(Icons.add,color: AppColors.kPrimaryTwo,size: 10.0,)))
                                   ],
                                 )

                             )),
                       ),

                       Column(
                         children: [
                           Icon(Icons.whatshot,size: 35.0,),
                           coustomTextWidgets.coustomText( '148K',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                         ],
                       ),

                       Column(
                         children: [
                           Icon(Icons.share,size: 35.0,),
                           coustomTextWidgets.coustomText( '18K',12.0,AppColors.backgroubdGrye,FontWeight.bold),
                         ],
                       ),
                     ],
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
                                DownloadsModel download = snapshot.data[index];
                                return _buildDownload(download);
                              });
                        }
                        else if(snapshot.hasError) {
                          return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                        }
                        return CircularProgressIndicator();
                      },

                    ),
                  )

                ],
              ),
            )

            ],
          )
        ),
      ),
    );
  }

  Widget _buildDownload(DownloadsModel download) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 140.0,
              height: 100.0,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(download.image)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 5.0, top: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      coustomTextWidgets.detailsText(download.text, TextStyle(
                          letterSpacing: 0.2,
                          // overflow: TextOverflow.ellipsis,
                          color: Colors.black
                      ), 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: coustomTextWidgets.defaultText(download.views, TextStyle(
                            color: AppColors.greyColor, fontWeight: FontWeight.w600
                        ), TextAlign.start),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: coustomTextWidgets.defaultText(download.channelName, TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 12.0,
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
