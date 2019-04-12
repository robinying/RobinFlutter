import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Search"),),
      body: Center(
        child: new Text(
          "Search",
          style: new TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
