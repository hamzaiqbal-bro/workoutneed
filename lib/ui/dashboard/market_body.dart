import 'package:flutter/material.dart';

class MarketBody extends StatefulWidget {
  const MarketBody({Key? key}) : super(key: key);

  @override
  _MarketBodyState createState() => _MarketBodyState();
}

class _MarketBodyState extends State<MarketBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Market"),
      ),
    );
  }
}
