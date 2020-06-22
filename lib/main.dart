import 'package:flutter/material.dart';
import 'package:Moim/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:Moim/firebase_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FirebaseProvider>(create: (_) => FirebaseProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moim",
      home: LoginPage(),
    );
  }
}
