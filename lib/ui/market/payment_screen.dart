import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("EasyPaisa", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
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
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.all(10.0),
          //       child: coustomTextWidgets.coustomText("Payment methods", 18.0, Colors.black, FontWeight.bold),
          //     ),
          //     Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //       child: MyIconTextButton(
          //         text: 'JazzCash',
          //         fontSize: 16.0,
          //         fontWeight: FontWeight.w600,
          //         iconData: Icons.add,
          //         alignment: MainAxisAlignment.start,
          //         onPress: () {
          //           //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
          //         },
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //       child: MyIconTextButton(
          //         text: 'EasyPaisa',
          //         fontSize: 16.0,
          //         fontWeight: FontWeight.w600,
          //         iconData: Icons.add,
          //         alignment: MainAxisAlignment.start,
          //         onPress: () {
          //           //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
          //         },
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //       child: MyIconTextButton(
          //         text: 'Bank Account',
          //         fontSize: 16.0,
          //         fontWeight: FontWeight.w600,
          //         iconData: Icons.add,
          //         alignment: MainAxisAlignment.start,
          //         onPress: () {
          //           //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
          //         },
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //       child: MyIconTextButton(
          //         text: 'Cash on Delivery',
          //         fontSize: 16.0,
          //         fontWeight: FontWeight.w600,
          //         iconData: Icons.add,
          //         alignment: MainAxisAlignment.start,
          //         onPress: () {
          //           //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
          //         },
          //       ),
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               coustomTextWidgets.coustomText("Subtotal (1 item)", 16.0, Colors.black, FontWeight.normal),
          //               coustomTextWidgets.coustomText("\$${347}", 16.0, Colors.black, FontWeight.bold)
          //             ],
          //           ),
          //         ),
          //         Container(
          //           margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               coustomTextWidgets.coustomText("Shipping Fee", 16.0, Colors.black, FontWeight.normal),
          //               coustomTextWidgets.coustomText("\$${5.99}", 16.0, Colors.black, FontWeight.bold)
          //             ],
          //           ),
          //         ),
          //         Container(
          //             margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          //             child: coustomTextWidgets.coustomText("Total : \$${352.99}", 16.0, AppColors.kPrimaryTwo, FontWeight.w600)),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
