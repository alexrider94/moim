import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
