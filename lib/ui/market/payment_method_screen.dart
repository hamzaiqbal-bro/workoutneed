import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/image_assets.dart';
import 'package:workour/ui/market/payment_screen.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextWidgets.appBarTextWidget("Payment"),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: AppColors.backgroundGrey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextWidgets.customText("Payment methods", 18.0, Colors.black, FontWeight.bold),
              ),
              DefImageTextButton(
                text: "JazzCash",
                imageUrl: ImageAssets.jazzCashIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'JazzCash',)));
                },
              ),
              DefImageTextButton(
                text: "EasyPaisa",
                imageUrl: ImageAssets.easyPaisaIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'EasyPaisa',)));
                },
              ),
              DefImageTextButton(
                text: "Bank Account",
                imageUrl: ImageAssets.bankAccountIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'Bank Account',)));
                },
              ),
              DefImageTextButton(
                text: "Cash on Delivery",
                imageUrl: ImageAssets.cashPaymentIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'Cash on Delivery',)));
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
