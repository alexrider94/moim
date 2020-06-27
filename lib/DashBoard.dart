import 'package:Moim/database.dart';
import 'package:flutter/material.dart';
import 'package:Moim/GatheringLists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:flutter/rendering.dart';
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
  Widget build(BuildContext context) {
    final String collectionName = 'Board';
    final String boardTitle = 'title';
    final String boardDateTime = 'dateTime';
    final String boardAuthor = 'author';
    final String boardAuthorId = 'authorId';
    TextEditingController _newTitleCon = TextEditingController();
    FirebaseProvider fp = Provider.of<FirebaseProvider>(context);

    final String loggedUserId = fp.getUser().uid;
    Future<dynamic> getUserNickname =
        DatabaseService().getUserNickname(loggedUserId);

    void createDoc(String title) async {
      String nickname;
      await getUserNickname.then((value) => nickname = value);
      DocumentReference df;
      df = await Firestore.instance.collection(collectionName).add({
        boardTitle: title,
        boardDateTime: Timestamp.now(),
        boardAuthor: nickname,
        boardAuthorId: loggedUserId,
      });
      DatabaseService()
          .addChatRoomInUserSetting(loggedUserId, df.documentID, title);
      DatabaseService()
          .makeChatRoom(title, df.documentID, nickname, boardAuthorId);
    }

    void showCreateDocDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create New Document"),
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
        child: GatheringLists(),
      ),
    );
  }
}

Widget myDrawer(BuildContext context) {
  return Container(
    width: 200,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('HEAD'),
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
              Navigator.pop(context);
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
