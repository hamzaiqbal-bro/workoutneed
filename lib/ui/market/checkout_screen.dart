import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/market/payment_method_screen.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Checkout", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.backgroubdGrye,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: MyIconTextButton(
                        text: 'Add Address',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        iconData: Icons.add,
                        alignment: MainAxisAlignment.center,
                        onPress: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white,
                      height: 5,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.shop, color: AppColors.kPrimaryTwo),
                            ),
                            coustomTextWidgets.coustomText("Package 1 of 1", 14.0, AppColors.kPrimaryTwo, FontWeight.normal)
                          ],
                        ),
                        Row(
                          children: [
                            coustomTextWidgets.coustomText("Shipped By ", 14.0, AppColors.kPrimaryTwo, FontWeight.normal),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: coustomTextWidgets.coustomText("Ahmad Khan", 12.0, AppColors.greyColor, FontWeight.normal),
                            )
                          ],
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
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: coustomTextWidgets.coustomText("Delivery Option", 18.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.receipt, color: AppColors.kPrimaryTwo),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: coustomTextWidgets.coustomText("\$${5.99}", 16.0, AppColors.kPrimaryTwo, FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1,
                              indent: 5.0,
                              endIndent: 5.0,
                              color: Color(0xFFF6F4F4),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    coustomTextWidgets.coustomText("Home Delivery", 16.0, Colors.black, FontWeight.w600),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: coustomTextWidgets.detailsText("HIST School and college, Muslim Abad, Hangu", TextStyle(fontSize: 12.0, color: Colors.black), 3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all<Color>(AppColors.kPrimaryTwo),
                              value: isChecked,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: coustomTextWidgets.coustomText("Product", 18.0, Colors.black, FontWeight.bold),
              ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: coustomTextWidgets.myCustomText("Nike NH3 (Summer Colletion)", 15.0, Colors.black, FontWeight.bold)
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.all<Color>(AppColors.kPrimaryTwo),
                                    value: isChecked,
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                child: coustomTextWidgets.detailsText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore", TextStyle(
                                    color: Colors.black), 2
                                )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: coustomTextWidgets.coustomText("\$${347}", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                      child: coustomTextWidgets.defaultText("item: ${1}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                      child: coustomTextWidgets.defaultText("Qty: ${1}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
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
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.backgroubdGrye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          coustomTextWidgets.coustomText("Subtotal (1 item)", 16.0, Colors.black, FontWeight.normal),
                          coustomTextWidgets.coustomText("\$${347}", 16.0, Colors.black, FontWeight.bold)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          coustomTextWidgets.coustomText("Shipping Fee", 16.0, Colors.black, FontWeight.normal),
                          coustomTextWidgets.coustomText("\$${5.99}", 16.0, Colors.black, FontWeight.bold)
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        child: coustomTextWidgets.coustomText("Total : \$${352.99}", 16.0, AppColors.kPrimaryTwo, FontWeight.w600)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: DefIconTextButton(
                  text: 'Proceed to Pay',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  iconData: Icons.payment,
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
