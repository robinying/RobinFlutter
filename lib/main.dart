import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:robin_app/page/app_home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Tab",
      theme: new ThemeData(
        primaryColor: new Color(0XFF1296DB),
        accentColor: new Color(0XFF1296DB),
      ),
      debugShowCheckedModeBanner: false,
      home: new AppHome(cameras),
    );
  }
}

