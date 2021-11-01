import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/CartModel.dart';
import 'package:workour/ui/market/checkout_screen.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextWidgets.appBarTextWidget("Cart"),
        centerTitle: true,
        elevation: 1.0,
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
                padding: const EdgeInsets.all(10.0),
                child: CustomTextWidgets.customText("Products", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
              ),
              Container(
                child: FutureBuilder(
                  future: readCartProductsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext bContext, int index) {
                              CartModel cartModel = snapshot.data[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1500),
                                child: FlipAnimation(
                                    child: _buildCartProducts(cartModel)),
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
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidgets.customText("Subtotal (1 item)", 16.0, Colors.black, FontWeight.normal),
                    CustomTextWidgets.customText("\$${347}", 16.0, Colors.black, FontWeight.bold)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidgets.customText("Shipping Fee", 16.0, Colors.black, FontWeight.normal),
                    CustomTextWidgets.customText("\$${5.99}", 16.0, Colors.black, FontWeight.bold)
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: CustomTextWidgets.customText("Total : \$${352.99}", 16.0, AppColors.kPrimaryTwo, FontWeight.w600)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: DefIconTextButton(
                  text: 'Checkout',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  iconData: Icons.payment,
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartProducts(CartModel cartProduct) {
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
          children: [
            Container(
              width: 120.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(cartProduct.imageUrl),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextWidgets.myCustomText(cartProduct.name, 15.0, Colors.black, FontWeight.bold)
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all<Color>(AppColors.kPrimaryTwo),
                          value: cartProduct.isChecked,
                          //shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              cartProduct.isChecked = !cartProduct.isChecked;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: CustomTextWidgets.detailsText(cartProduct.details, TextStyle(
                          color: Colors.black), 2
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomTextWidgets.customText("\$${cartProduct.price}", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: CustomTextWidgets.defaultText("item: ${cartProduct.item}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                            child: CustomTextWidgets.defaultText("Qty: ${cartProduct.quantity}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
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
    );
  }

}

