import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/CategoryModel.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/ui/market/cart_screen.dart';
import 'package:workour/ui/market/category_products.dart';
import 'package:workour/ui/market/messaging.dart';
import 'package:workour/ui/market/product_details.dart';
import 'package:workour/ui/market/seller_profile.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class MarketBody extends StatefulWidget {
  const MarketBody({Key? key}) : super(key: key);

  @override
  _MarketBodyState createState() => _MarketBodyState();
}

class _MarketBodyState extends State<MarketBody> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final List<String> imgList = [
    imageAssets.marketMainImage,
    imageAssets.marketMainImage,
    imageAssets.marketMainImage,
    imageAssets.marketMainImage
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: imageWidgets.circularImage(imageAssets.profileImage, 60.0, 60.0),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SellerProfile()));
          },
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.message, AppColors.kPrimaryOne),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Messaging()));
              }
          ),
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.shopping_cart, AppColors.kPrimaryOne),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
              }
          ),
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryOne),
              onPressed: () {}
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.8,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  ),
                  items: imgList
                      .map((item) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(item, fit: BoxFit.fill, width: MediaQuery.of(context).size.width - 50),
                  ))
                      .toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.backgroubdGrye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("Categories", 20.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: FutureBuilder(
                        future: readCategoryJSONData(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData){
                            return AnimationLimiter(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 1.0/0.75,
                                  ),
                                  itemBuilder: (BuildContext bContext, int index) {
                                    CategoryModel categoryModel = snapshot.data[index];
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 3,
                                      duration: const Duration(milliseconds: 1500),
                                      child: FlipAnimation(
                                          child: _buildCategories(categoryModel)),
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
                      child: coustomTextWidgets.coustomText("Trending", 20.0, Colors.black, FontWeight.bold),
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
                                            child: _buildProducts(productModel)),
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
                      child: coustomTextWidgets.coustomText("Most Popular", 20.0, Colors.black, FontWeight.bold),
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
                                            child: _buildProducts(productModel)),
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
                      child: coustomTextWidgets.coustomText("Feature Products", 20.0, Colors.black, FontWeight.bold),
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
                                    itemCount: snapshot.data.length,
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
                                            child: _buildFeatureProducts(productModel, index)),
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
              )
            ],
          ),
        ),
      )
    );
  }

  _buildCategories(CategoryModel categoryModel) {
    return InkWell(
      child: Container(
        child: IntrinsicHeight(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                    categoryModel.categoryImageUrl,
                    fit: BoxFit.fill
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: coustomTextWidgets.coustomText(categoryModel.categoryName, 18.0, AppColors.whiteColor, FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CategoryProducts()));
      },
    );
  }

  _buildProducts(ProductsModel productModel) {
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

  _buildFeatureProducts(ProductsModel productModel, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetails()));
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
                        child: coustomTextWidgets.coustomText(productModel.name, 16.0, Colors.black, FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: coustomTextWidgets.coustomText("\$${productModel.price}", 14.0, AppColors.kPrimaryTwo, FontWeight.normal),
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
                    child: imageWidgets.circleAvatar(productModel.iconUrl, 16.0, 18.0),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
