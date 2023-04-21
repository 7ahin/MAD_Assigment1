import 'package:flutter/material.dart';
class AssetsImageWidget extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Picture'),
      ),
      body: Container(
        color: Colors.white,
        child: Image.asset(
          'images/profile.png',
         
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
