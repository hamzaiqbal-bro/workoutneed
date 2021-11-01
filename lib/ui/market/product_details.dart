import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/models/ReviewsModel.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/decoratedContainerWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

import 'messaging.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  TextEditingController textEditingController = new TextEditingController();
  IconData iconData = Icons.keyboard_arrow_down_outlined;
  bool showAllReviews = false;

  List<String> sizeList = ["S", "L", "X", "XL", "XXL", "S", "L", "X", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text("Store", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: imageWidgets.circularImage(imageAssets.profileImage, 60.0, 60.0),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryOne),
              onPressed: () {
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        child: imageWidgets.imageWidget(imageAssets.productImage, BoxFit.fitWidth),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.backgroubdGrye,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),
                            Divider(
                              thickness: 1.5,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.white,
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                    child: coustomTextWidgets.coustomText("Color: Army green", 15.0, Colors.black, FontWeight.bold),
                                  ),
                                  Container(
                                    height: 70.0,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: ListView.builder(
                                        itemCount: 10,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext bContext, int position) {
                                          return Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                              child: imageWidgets.circleAvatar(imageAssets.profileImage, 18.0, 20.0));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.5,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.white,
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                    child: coustomTextWidgets.coustomText("Size: ", 15.0, Colors.black, FontWeight.bold),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 70.0,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: ListView.builder(
                                        itemCount: sizeList.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext bContext, int position) {
                                          return Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                                              child: DecoratedContainerWidgets.simpleContainer(coustomTextWidgets.myCustomText(sizeList[position], 16.0, AppColors.black[100]!, FontWeight.bold)));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.5,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.white,
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                    child: coustomTextWidgets.coustomText("Product Details: ", 15.0, Colors.black, FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: coustomTextWidgets.detailsText(StringAssets.loremIpsumText, TextStyle(fontSize: 14.0, color: AppColors.black[100]!, fontWeight: FontWeight.normal), 5),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.5,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.white,
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: imageWidgets.circleAvatar(imageAssets.profileImage, 18, 20),
                                ),
                                Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: PostReviewInputField(textEditingController: textEditingController),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: imageWidgets.ccircleAvatar(Icons.add, AppColors.kPrimaryTwo, 18, 20, Colors.white, AppColors.kPrimaryTwo),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: imageWidgets.ccircleAvatar(Icons.camera_alt, Colors.white, 18, 20, AppColors.kPrimaryTwo, AppColors.kPrimaryTwo),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: DecoratedContainerWidgets.mainContainer(
                        MediaQuery.of(context).size.width,
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    child: coustomTextWidgets.coustomText("Nike NH3 (Summer Collection)", 16.0, Colors.black, FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.share, color: AppColors.black[400]),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: coustomTextWidgets.coustomText("\$${347}", 16.0, AppColors.kPrimaryTwo, FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: RatingBarIndicator(
                                    rating: 4,
                                    itemCount: 5,
                                    itemSize: 15.0,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: AppColors.kPrimaryTwo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1.5,
                              indent: 0,
                              endIndent: 0,
                              color: AppColors.backgroubdGrye,
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: DecoratedContainerWidgets.decoratedContainer("Buy Now", Icons.shopping_bag, AppColors.kPrimaryTwo),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: DecoratedContainerWidgets.decoratedContainer("Add to Cart", Icons.add_shopping_cart, AppColors.kPrimaryTwo),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Messaging()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            IconWidgets.customIcon(Icons.message, AppColors.kPrimaryTwo),
                                            coustomTextWidgets.myCustomText("Chat", 14.0, AppColors.kPrimaryTwo, FontWeight.normal)
                                          ],
                                        ),
                                      ),
                                    ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: coustomTextWidgets.coustomText("Reviews:", 18.0, Colors.black, FontWeight.bold),
              ),
              Container(
                child: FutureBuilder(
                  future: readRatingAndReviewsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length > 2
                                ? showAllReviews == false ? 2 : snapshot.data.length
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
                      return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
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
                      Colors.black,
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
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 15.0),
                color: AppColors.backgroubdGrye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("Seller:", 18.0, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                            child: imageWidgets.circleAvatar(imageAssets.profileImage, 28.0, 30.0)),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                  child: coustomTextWidgets.coustomText("Haseeb Shinwari", 16.0, AppColors.kPrimaryTwo, FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: coustomTextWidgets.coustomText("Phone Number: 989-288-6896", 14.0, Colors.black, FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: coustomTextWidgets.customText("Address: 428 Hart Ridge Road, SANTA MONICA, California", 14.0, Colors.black, FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                                  child: Row(
                                    children: [
                                      coustomTextWidgets.customText("Seller Rating: ", 14.0, Colors.black, FontWeight.normal),
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
                      child: coustomTextWidgets.coustomText("Products From Seller", 18.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      height: 180.0,
                      padding: EdgeInsets.all(5.0),
                      child: FutureBuilder(
                        future: readTrendingProductsJSONData(),
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
                                            child: _buildSellerProducts(productModel)),
                                      );
                                    })
                            );
                          }
                          else if(snapshot.hasError) {
                            return coustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
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
                      child: coustomTextWidgets.coustomText("You may also like", 18.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      height: 180.0,
                      padding: EdgeInsets.all(5.0),
                      child: FutureBuilder(
                        future: readTrendingProductsJSONData(),
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
                                            child: _buildLikeProducts(productModel)),
                                      );
                                    })
                            );
                          }
                          else if(snapshot.hasError) {
                            return coustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                          }
                          return CircularProgressIndicator();
                        },

                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                child: imageWidgets.circleAvatar(reviewsModel.userImageUrl, 18.0, 20.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: coustomTextWidgets.myCustomText(reviewsModel.userName, 15.0, Colors.black, FontWeight.w600),
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
                        child: coustomTextWidgets.defaultText(reviewsModel.date, TextStyle(color: AppColors.greyColor, fontSize: 12.0), TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: coustomTextWidgets.detailsText(reviewsModel.reviewText, TextStyle(
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

  _buildSellerProducts(ProductsModel productModel) {
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
                          child: coustomTextWidgets.customText(productModel.name, 14.0, Colors.black, FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: imageWidgets.circularImage(productModel.iconUrl, 30.0, 30.0))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildLikeProducts(ProductsModel productModel) {
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
                          child: coustomTextWidgets.customText(productModel.name, 14.0, Colors.black, FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: imageWidgets.circularImage(productModel.iconUrl, 30.0, 30.0))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
