import 'package:flutter/material.dart';
import 'package:Moim/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:Moim/FireBaseProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FirebaseProvider>(create: (_) => FirebaseProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF68a682),
        accentColor: Color(0xFF2b3634),
      ),
      title: "Moim",
      home: LoginPage(),
    );
  }
}
