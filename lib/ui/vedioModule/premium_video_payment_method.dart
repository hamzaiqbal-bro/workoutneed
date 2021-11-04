import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/market/payment_screen.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/decoratedContainerWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class PremiumVideoPaymentMethod extends StatefulWidget {
  const PremiumVideoPaymentMethod({Key? key}) : super(key: key);

  @override
  _PremiumVideoPaymentMethodState createState() => _PremiumVideoPaymentMethodState();
}

class _PremiumVideoPaymentMethodState extends State<PremiumVideoPaymentMethod> {
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
      backgroundColor: AppColors.backgroubdGrye,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedContainerWidgets.decoratedContainer(
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidgets.customText("\$${399.9}/", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                              CustomTextWidgets.customText("3 months", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidgets.customText("\$${0.99}/", 16.0, AppColors.kPrimaryTwo, FontWeight.normal),
                              CustomTextWidgets.customText("Day", 16.0, Colors.black, FontWeight.normal)
                            ],
                          ),
                        ],
                      ),
                      ImageWidgets.customImageWidgets(imageAssets.bestDealImage)
                    ],
                  )
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextWidgets.customText("Payment methods", 18.0, Colors.black, FontWeight.bold),
              ),
              DefImageTextButton(
                text: "JazzCash",
                imageUrl: imageAssets.jazzCashIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'JazzCash',)));
                },
              ),
              DefImageTextButton(
                text: "EasyPaisa",
                imageUrl: imageAssets.easyPaisaIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'EasyPaisa',)));
                },
              ),
              DefImageTextButton(
                text: "Bank Account",
                imageUrl: imageAssets.bankAccountIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'Bank Account',)));
                },
              ),
              DefImageTextButton(
                text: "Cash on Delivery",
                imageUrl: imageAssets.cashPaymentIcon,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(paymentMethod: 'Cash on Delivery',)));
                },
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
