import 'package:flutter/material.dart';

class MoreInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("More Info"),),
      body: Center(
        child: new Text(
          "More Info",
          style: new TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
