import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class Payment extends StatefulWidget {

  const Payment({Key? key, required this.paymentMethod}) : super(key: key);
  final String paymentMethod;

  @override
  _PaymentState createState() => _PaymentState(paymentMethod: paymentMethod);
}

class _PaymentState extends State<Payment> {

  TextEditingController textEditingController = TextEditingController();
  _PaymentState({required this.paymentMethod});
  final String paymentMethod;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = "Pay with your " + paymentMethod + " mobile account. Make sure that your account is active. also you have enough balance in your account. Confirm your payment through OTP.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(paymentMethod, style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: coustomTextWidgets.coustomText(paymentMethod, 18.0, Colors.black, FontWeight.normal),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: coustomTextWidgets.detailsText(text, TextStyle(color: AppColors.greyColor), 5),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: BackgroundInputField(textEditingController: textEditingController),
              ),
              Column(
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: DefIconTextButton(
                  text: 'Pay Now',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  iconData: Icons.payment,
                  onPress: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod()));
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
