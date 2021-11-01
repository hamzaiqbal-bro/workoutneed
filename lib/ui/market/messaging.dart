import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/decoratedContainerWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextWidgets.appBarTextWidget("John Doe"),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: AppColors.backgroubdGrye,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: AppColors.smokeWhiteColor, spreadRadius: 1.5),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        width: 120.0,
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(imageAssets.yellowShoesImage),
                          ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                          color: Colors.redAccent,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomTextWidgets.myCustomText("Nike NH3 (Summer Collection)", 15.0, Colors.black, FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                child: CustomTextWidgets.detailsText(StringAssets.loremIpsumSampleText, TextStyle(
                                    color: Colors.black), 2
                                )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CustomTextWidgets.customText("\$${347}", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                      child: CustomTextWidgets.defaultText("item: ${1}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                      child: CustomTextWidgets.defaultText("Qty: ${1}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
                height: 5,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: ImageWidgets.circleAvatar(imageAssets.profileImage, 20.0, 22.0),
                  ),
                  DecoratedContainerWidgets.messagingContainer(
                      AppColors.black[300]!,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CustomTextWidgets.customText("Hello John", 16.0, AppColors.black[200]!, FontWeight.w600),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: CustomTextWidgets.customText("9:13 PM", 14.0, AppColors.black[400]!, FontWeight.normal)),
                        ],
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DecoratedContainerWidgets.messagingContainer(
                      AppColors.black[400]!,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CustomTextWidgets.customText("Hello! How are you?", 16.0, AppColors.black[200]!, FontWeight.w600),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: CustomTextWidgets.customText("9:13 PM", 14.0, AppColors.black[400]!, FontWeight.normal)),
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: ImageWidgets.circleAvatar(imageAssets.profileImage, 20.0, 22.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            IconWidgets.sizedIcon(Icons.add, AppColors.kPrimaryTwo, 35.0),
            IconWidgets.sizedIcon(Icons.camera_alt_rounded, AppColors.black[300]!, 35.0),
            IconWidgets.sizedIcon(Icons.image, AppColors.black[300]!, 35.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: MessageInputField(textEditingController: textEditingController),
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor: AppColors.kPrimaryTwo,
              padding: EdgeInsets.all(5.0),
              child: IconWidgets.sizedIcon(Icons.send, Colors.white, 35.0),
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}
