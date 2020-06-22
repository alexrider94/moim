import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            AppBar(
              title: Text(
                'Moim Chat',
                style: TextStyle(color: Colors.white, fontFamily: 'BMHANNA'),
              ),
              backgroundColor: Colors.lime[500],
            ),
          ],
        ),
      ),
    );
  }
}
