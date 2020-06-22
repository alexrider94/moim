import 'package:Moim/ChatPage.dart';
import 'package:Moim/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Moim/DashBoard.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> _myPages = [
    DashBoard(),
    ChatPage(),
    ProfilePage(),
  ];

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        //Top Bar
        appBar: AppBar(
          title: Text(
            'Moim Board',
            style: TextStyle(fontFamily: 'BMHANNA'),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.lime[500],
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child:
              //MAIN SECTOR
              _myPages.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightGreen[100],
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.view_day), title: new Text('BOARD')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat), title: new Text('CHAT')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle),
                title: new Text('PROFILE')),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
