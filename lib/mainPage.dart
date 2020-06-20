import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  String id = '';
  String password = '';

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            child: Text('1'),
          ),
          Container(
            child: Text('2'),
          )
        ],
      ),
    );
  }
}
