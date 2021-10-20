import 'package:flutter/material.dart';

class VideoBody extends StatefulWidget {
  const VideoBody({Key? key}) : super(key: key);

  @override
  _VideoBodyState createState() => _VideoBodyState();
}

class _VideoBodyState extends State<VideoBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Video"),
      ),
    );
  }
}
