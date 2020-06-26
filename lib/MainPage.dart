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
        body: Container(
          color: Theme.of(context).primaryColor,
          child:
              //MAIN SECTOR
              _myPages.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          unselectedItemColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.dashboard), title: new Text('BOARD')),
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
