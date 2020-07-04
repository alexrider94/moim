import 'package:Moim/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Moim/BoardList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

DashBoardState pageState;

class DashBoard extends StatefulWidget {
  @override
  DashBoardState createState() {
    pageState = DashBoardState();
    return pageState;
  }
}

class DashBoardState extends State<DashBoard> {
  String _nickname = "";

  void getUserInfo() async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      Future<dynamic> getUserNickname =
          DatabaseService().getUserNickname(user.uid);
      getUserNickname.then((nickname) {
        setState(() {
          _nickname = nickname;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Widget build(BuildContext context) {
    final String collectionName = 'Board';
    final String boardTitle = 'title';
    final String boardDateTime = 'dateTime';
    final String boardAuthor = 'author';
    final String boardAuthorId = 'authorId';

    TextEditingController _newTitleCon = TextEditingController();

    FirebaseProvider fp = Provider.of<FirebaseProvider>(context);

    void createDoc(String title) async {
      DocumentReference df;
      df = await Firestore.instance.collection(collectionName).add({
        boardTitle: title,
        boardDateTime: Timestamp.now(),
        boardAuthor: _nickname,
        boardAuthorId: fp.getUser().uid,
      });
      DatabaseService()
          .makeChatRoom(title, df.documentID, _nickname, fp.getUser().uid);
    }

    void showCreateDocDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create New Group"),
            content: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    maxLength: 20,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: _newTitleCon,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  _newTitleCon.clear();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Create"),
                onPressed: () {
                  if (_newTitleCon.text.isNotEmpty) {
                    createDoc(_newTitleCon.text);
                  }
                  _newTitleCon.clear();
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: myDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[200],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: showCreateDocDialog,
      ),
      appBar: myAppBar(), //myAppBar(),
      body: Container(
        color: Theme.of(context).accentColor,
        width: MediaQuery.of(context).size.width,
        child: BoardList(),
      ),
    );
  }

  Widget myDrawer(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(_nickname),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('FRIEND'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('EXIT'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget myAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text("MOIM"),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.bookmark),
          onPressed: null,
        ),
      ],
    );
  }
}
