import 'package:flutter/material.dart';
import 'package:Moim/GatheringLists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    final String boardContent = 'content';
    final String boardDateTime = 'dateTime';

    TextEditingController _newTitleCon = TextEditingController();
    TextEditingController _newDescCon = TextEditingController();

    void createDoc(String title, String description) {
      Firestore.instance.collection(collectionName).add({
        boardTitle: title,
        boardContent: description,
        boardDateTime: Timestamp.now(),
      });
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
                    decoration: InputDecoration(labelText: "Title"),
                    controller: _newTitleCon,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Description"),
                    controller: _newDescCon,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  _newTitleCon.clear();
                  _newDescCon.clear();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Create"),
                onPressed: () {
                  if (_newDescCon.text.isNotEmpty &&
                      _newTitleCon.text.isNotEmpty) {
                    createDoc(_newTitleCon.text, _newDescCon.text);
                  }
                  _newTitleCon.clear();
                  _newDescCon.clear();
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green[100],
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
          iconSize: 32,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent[200],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: showCreateDocDialog),
      body: Container(
        color: Colors.green[100],
        width: MediaQuery.of(context).size.width,
        child: GatheringLists(),
      ),
    );
  }
}
