import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text("个人资料",
              style: TextStyle(fontSize: 20.0, color: Colors.red))),
      body: Center(
          child: Text(
        "个人资料",
        style: new TextStyle(fontSize: 30.0),
      )),
    );
  }
}
