import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  String id = '';
  String password = '';

  Widget build(BuildContext context) {
    final idField = Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'ID',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
          ),
          onChanged: (text) {
            id = text;
          }),
    );

    final passwordField = Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onChanged: (text) {
          password = text;
        },
      ),
    );

    return Stack(
      children: [
        //1 right background
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(color: Colors.lime[100]),
        ),
        //2 left background
        Container(
          width: MediaQuery.of(context).size.width / 1.7,
          decoration: new BoxDecoration(color: Colors.lightGreen[50]),
        ),
        //3 text
        Container(
          alignment: Alignment(0.5, 0.0),
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              child: Column(
                children: [
                  Text(
                    '모',
                    style: TextStyle(
                      fontFamily: 'JejuGothic',
                      fontSize: 72,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '임',
                    style: TextStyle(
                      fontFamily: 'JejuGothic',
                      fontSize: 72,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment(0.6, 0.8),
          child: FlatButton(
            onPressed: () {
              print("$id  $password");
            },
            child: Text(
              '로그인',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          width: 250,
          bottom: 200,
          child: idField,
        ),
        Positioned(
          left: 100,
          width: 250,
          bottom: 120,
          child: passwordField,
        ),
      ],
    );
  }
}
