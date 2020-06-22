import 'package:flutter/material.dart';
import 'package:Moim/MainPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  InkWell _buildButtonColumn(
      Color color, IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () => {
        if (label == 'BOARD')
          {
            print(label),
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => (MainPage())))
          }
        else if (label == 'CHAT')
          {print(label)}
        else if (label == 'PROFILE')
          {
            print(label),
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (ProfilePage())))
          }
        else
          print('error')
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.indigo[300];
    return Scaffold(
      body: ListView(
        children: <Widget>[
          AppBar(
            title: Text(
              'Moim User Info',
              style: TextStyle(color: Colors.white, fontFamily: 'BMHANNA'),
            ),
            backgroundColor: Colors.lime[500],
          ),
          Container(
            color: Colors.lime[200],
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButtonColumn(color, Icons.view_day, 'BOARD', context),
                _buildButtonColumn(color, Icons.chat, 'CHAT', context),
                _buildButtonColumn(
                    color, Icons.account_circle, 'Profile', context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
