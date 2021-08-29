///
/// main
///
/// created by DZDcyj at 2021/8/29
///
import 'package:aliyun_oss_handler/app_module.dart';
import 'package:aliyun_oss_handler/page/homepage/view/homepage.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';

void main() {
  startDartIn(appModule);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage('Flutter Demo Home Page'),
    );
  }
}
