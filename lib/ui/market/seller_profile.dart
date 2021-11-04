import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/image_assets.dart';
import 'package:workour/constants/string_assets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/models/ReviewsModel.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/image_widgets.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {

  IconData iconData = Icons.keyboard_arrow_down_outlined;
  bool showAllReviews = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                            child: ImageWidgets.circleAvatar(ImageAssets.personProfileImage, 32.0, 35.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                        child: CustomTextWidgets.customText("Paul Lee", 20.0, AppColors.kPrimaryTwo, FontWeight.w600),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.star_border),
                                            color: AppColors.kPrimaryOne,
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.message),
                                            color: AppColors.kPrimaryTwo,
                                            onPressed: () {},
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: CustomTextWidgets.customText("Phone Number: 989-288-6896", 14.0, Colors.black, FontWeight.normal),
                                  ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: CustomTextWidgets.customText("Address: 428 Hart Ridge Road, SANTA MONICA, California", 14.0, Colors.black, FontWeight.normal),
                                  ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                                    child: Row(
                                      children: [
                                        CustomTextWidgets.customText("Seller Rating: ", 14.0, Colors.black, FontWeight.normal),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: RatingBarIndicator(
                                            rating: 4.5,
                                            itemCount: 5,
                                            itemSize: 18.0,
                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: AppColors.kPrimaryTwo,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.white,
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: CustomTextWidgets.detailsText(StringAssets.loremIpsumSampleText, TextStyle(color: AppColors.greyColor), 4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ImageWidgets.customImageWidgets(ImageAssets.googleIcon),
                            SizedBox(width: AppStyles.tweentynumber,),
                            ImageWidgets.customImageWidgets(ImageAssets.facebookIcon),
                            SizedBox(width: AppStyles.tweentynumber,),
                            ImageWidgets.customImageWidgets(ImageAssets.twitterIcon),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: CustomTextWidgets.customText("Popular From Seller", 20.0, Colors.black, FontWeight.bold),
                      ),
                      Container(
                        height: 180.0,
                        padding: EdgeInsets.all(5.0),
                        child: FutureBuilder(
                          future: readPopularProductsJSONData(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData){
                              return AnimationLimiter(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext bContext, int index) {
                                        ProductsModel productModel = snapshot.data[index];
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 1500),
                                          child: FlipAnimation(
                                              child: _buildPopularProducts(productModel)),
                                        );
                                      })
                              );
                            }
                            else if(snapshot.hasError) {
                              return CustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                            }
                            return CircularProgressIndicator();
                          },

                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: CustomTextWidgets.customText("Products", 20.0, Colors.black, FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: FutureBuilder(
                          future: readProductsJSONData(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData){
                              return AnimationLimiter(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length > 4 ? 4 : snapshot.data.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        childAspectRatio: 1.0/1.5,
                                      ),
                                      itemBuilder: (BuildContext bContext, int index) {
                                        ProductsModel productModel = snapshot.data[index];
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 1500),
                                          child: FlipAnimation(
                                              child: _buildProducts(productModel, index)),
                                        );
                                      })
                              );
                            }
                            else if(snapshot.hasError) {
                              return CustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                            }
                            return CircularProgressIndicator();
                          },

                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: CustomTextWidgets.customText("Reviews", 18.0, Colors.black, FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: readRatingAndReviewsJSONData(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData){
                        return AnimationLimiter(
                          child: ListView.builder(
                              itemCount: snapshot.data.length > 3
                                  ? showAllReviews == false ? 3 : snapshot.data.length
                                  : snapshot.data.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext bContext, int index) {
                                ReviewsModel reviewsModel = snapshot.data[index];
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1500),
                                  child: FlipAnimation(
                                      child: _buildReviews(reviewsModel)),
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
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: IconWidgets.sizedIcon(
                        iconData,
                        AppColors.kPrimaryTwo,
                        60.0
                    ),
                    onPressed: () {
                      setState(() {
                        if(iconData == Icons.keyboard_arrow_up_outlined) {
                          iconData = Icons.keyboard_arrow_down_outlined;
                          showAllReviews = false;
                        }
                        else {
                          iconData = Icons.keyboard_arrow_up_outlined;
                          showAllReviews = true;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPopularProducts(ProductsModel productModel) {
    return IntrinsicHeight(
      child: Container(
        width: 180.0,
        margin: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                child: Image.asset(
                    productModel.imageUrl,
                    fit: BoxFit.fill
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTextWidgets.customText(productModel.name, 14.0, Colors.black, FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ImageWidgets.circularImage(productModel.iconUrl, 30.0, 30.0))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildProducts(ProductsModel productModel, int index) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetails()));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.smokeWhiteColor,
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200.0,
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                          productModel.imageUrl,
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: index%2 != 0 ? AppColors.kPrimaryTwo : AppColors.whiteColor),
                        onPressed: () { },),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTextWidgets.customText(productModel.name, 16.0, Colors.black, FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTextWidgets.customText("\$${productModel.price}", 14.0, AppColors.kPrimaryTwo, FontWeight.normal),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          child: RatingBarIndicator(
                            rating: productModel.rating,
                            itemCount: 5,
                            itemSize: 18.0,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColors.kPrimaryTwo,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: ImageWidgets.circleAvatar(productModel.iconUrl, 16.0, 18.0),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  _buildReviews(ReviewsModel reviewsModel) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: ImageWidgets.circleAvatar(reviewsModel.userImageUrl, 18.0, 20.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: CustomTextWidgets.myCustomText(reviewsModel.userName, 15.0, Colors.black, FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RatingBarIndicator(
                          rating: reviewsModel.rating,
                          itemCount: 5,
                          itemSize: 15.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: AppColors.kPrimaryTwo,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CustomTextWidgets.defaultText(reviewsModel.date, TextStyle(color: AppColors.greyColor, fontSize: 12.0), TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: CustomTextWidgets.detailsText(reviewsModel.reviewText, TextStyle(
                          color: Colors.black, letterSpacing: 0.2, fontSize: 13.0), 3
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: IconWidgets.customIcon(Icons.more_vert, Colors.black),
            )
          ],
        ),
      ),
    );
  }

}
