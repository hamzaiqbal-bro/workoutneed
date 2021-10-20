import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/iconWidgets.dart';

class PurchaseProducts extends StatefulWidget {
  const PurchaseProducts({Key? key}) : super(key: key);

  @override
  _PurchaseProductsState createState() => _PurchaseProductsState();
}

class _PurchaseProductsState extends State<PurchaseProducts> with SingleTickerProviderStateMixin {

  late TabController tabController;
  static List<String> links = [
    "https://i.pinimg.com/originals/cc/18/8c/cc188c604e58cffd36e1d183c7198d21.jpg",
    "https://www.kyoceradocumentsolutions.be/blog/wp-content/uploads/2019/03/iStock-881331810.jpg",
    "https://resources.matcha-jp.com/resize/720x2000/2020/04/23-101958.jpeg"
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
        backgroundColor: AppColors.backgroubdGrye,
        elevation: 0,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: [
          IconButton(onPressed: null, icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryTwo))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200.0,
              color: AppColors.backgroubdGrye,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
