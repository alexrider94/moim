import 'package:flutter/material.dart';
import 'package:Moim/authpage.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
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
            child: Container(
              padding: const EdgeInsets.fromLTRB(220, 160, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '모',
                        style: TextStyle(
                          fontFamily: 'BMHANNA',
                          fontSize: 72,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '질게',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '임',
                        style: TextStyle(
                          fontFamily: 'BMHANNA',
                          fontSize: 72,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '하자',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment(-0.6, 1),
            child: Image.asset('images/icons8-tree-64.png', scale: 0.4),
          ),
          Container(
            alignment: Alignment(0.6, 0.8),
            child: RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(14.0),
                side: BorderSide(color: Colors.lightGreenAccent),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (AuthPage())),
                );
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontFamily: 'BMHANNA',
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
