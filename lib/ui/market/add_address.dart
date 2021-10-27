import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/market/checkout_screen.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/stateless_widgets.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  TextEditingController textEditingController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  bool isSelected = false;
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Address", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
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
                child: coustomTextWidgets.coustomText("Enter Details", 18.0, Colors.black, FontWeight.bold),
              ),
              Container(
                child: Form(
                    key: _addressFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: coustomTextWidgets.coustomText("Full Name", 14.0, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GreyInputField(
                            hintText: "Enter Your Full Name",
                            textEditingController: textEditingController,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
                          child: coustomTextWidgets.coustomText("Phone Number", 14.0, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GreyInputField(
                            hintText: "Enter Your Phone Number",
                            textEditingController: textEditingController,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
                          child: coustomTextWidgets.coustomText("Province", 14.0, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GreyInputField(
                            hintText: "Enter Your Province Name",
                            textEditingController: textEditingController,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
                          child: coustomTextWidgets.coustomText("City", 14.0, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GreyInputField(
                            hintText: "Enter Your City Name",
                            textEditingController: textEditingController,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                          )
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
                          child: coustomTextWidgets.coustomText("Address", 14.0, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: GreyInputField(
                            hintText: "Enter Your Delivery Address",
                            textEditingController: textEditingController,
                            inputAction: TextInputAction.done,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(height: 20.0)
                      ],
                    )),
              ),
              Container(
                color: AppColors.backgroubdGrye,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MyIconTextButton(
                            text: 'Office',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            iconData: Icons.shopping_bag,
                            iconSize: 25.0,
                            alignment: MainAxisAlignment.center,
                            onPress: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
                            },
                          ),
                        ),
                        Expanded(
                          child: MyIconTextButton(
                            text: 'Home',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            iconData: Icons.home,
                            iconSize: 25.0,
                            alignment: MainAxisAlignment.center,
                            onPress: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut()));
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white,
                      height: 5,
                    ),
                    SwitchListTile(
                        value: isSwitch,
                        title: coustomTextWidgets.myCustomText("Make it default shipping address", 14.0, Colors.black, FontWeight.normal),
                        activeColor: AppColors.kPrimaryTwo,
                        onChanged: (bool val) {
                          setState(() {
                            isSwitch = !isSwitch;
                          });
                        },
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white,
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: DefIconTextButton(
                        text: 'Save Address',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        iconData: Icons.camera_alt,
                        onPress: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckOut()));
                        },
                      ),
                    ),
                  ],
                )
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: coustomTextWidgets.coustomText("Added Address(s)", 18.0, Colors.black, FontWeight.bold),
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: !isSelected ? Colors.white : Colors.black,
                          boxShadow: [
                            BoxShadow(color: AppColors.smokeWhiteColor, spreadRadius: 1.5),
                          ],
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.location_pin), color: AppColors.kPrimaryTwo, onPressed: () {}),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: coustomTextWidgets.myCustomText("Zahid Ullah Khan", 14.0, AppColors.kPrimaryTwo, FontWeight.bold)
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                              color: AppColors.backgroubdGrye,
                                            ),
                                              child: coustomTextWidgets.myCustomText("Default shipping address", 12.0, Colors.black, FontWeight.normal)
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                                color: AppColors.kPrimaryTwo,
                                              ),
                                              child: coustomTextWidgets.myCustomText("Office", 12.0, Colors.white, FontWeight.normal)
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: coustomTextWidgets.myCustomText("Phone Number: 989-2886896", 15.0, AppColors.greyColor, FontWeight.normal),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                      child: coustomTextWidgets.myCustomText("Address: 4285 Hart Ridge Road, SANTA MONICA, California", 15.0, AppColors.greyColor, FontWeight.normal),
                                    ),
                                    SizedBox(height: 10.0)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                    ),
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
