import 'package:flutter/material.dart';
//import 'package:flutter_application/sample.dart';
import 'package:flutter_application_1/page/mainHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Content',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(
        title: '',
      ),
    );
  }
}
