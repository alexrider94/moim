import 'package:Moim/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class GatheringLists extends StatefulWidget {
  @override
  GatheringListsState createState() => GatheringListsState();
}

class GatheringListsState extends State<GatheringLists> {
  static FirebaseProvider fp;
  final String collectionName = 'Board';
  final String boardTitle = 'title';
  final String boardDateTime = 'dateTime';
  final String boardAuthorName = 'admin';

  TextEditingController _undTitleCon = TextEditingController();

  void getNickname(BuildContext context, DocumentSnapshot document) async {
    String nickname;
    Future<dynamic> getUserNickname =
        DatabaseService().getUserNickname(fp.getUser().uid);
    await getUserNickname.then((value) => nickname = value);
    DatabaseService().changeNickname(document.documentID, nickname);
  }

  void showJoinDialog(DocumentSnapshot doc) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(doc['title']),
            content: Container(
              height: 50,
              child: Column(
                children: <Widget>[Text('Do you want to join group?')],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () async {
                  String nickname;
                  Future<dynamic> getUserNickname =
                      DatabaseService().getUserNickname(fp.getUser().uid);
                  await getUserNickname.then((value) => nickname = value);
                  DatabaseService().addUserInChatRoom(
                      fp.getUser().uid, nickname, doc.documentID);
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void showUpdateOrDeleteDialog(DocumentSnapshot doc) {
    _undTitleCon.text = doc[boardTitle];
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update/Delete Document"),
          content: Container(
            height: 200,
            child: Column(
              children: <Widget>[
                TextField(
                  maxLength: 20,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _undTitleCon,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                _undTitleCon.clear();
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Update"),
              onPressed: () {
                if (_undTitleCon.text.isNotEmpty) {
                  updateDoc(doc.documentID, _undTitleCon.text);
                }
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Delete"),
              onPressed: () {
                deleteDoc(doc.documentID);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  // 문서 갱신 (Update)
  void updateDoc(String docID, String title) {
    Firestore.instance
        .collection(collectionName)
        .document(docID)
        .updateData({boardTitle: title});
    DatabaseService().updateChatRoom(docID, title);
  }

  // 문서 삭제 (Delete)
  void deleteDoc(String docID) {
    DatabaseService().deleteChatRoom(docID, fp.getUser().uid);
    Firestore.instance.collection(collectionName).document(docID).delete();
  }

  Widget _buildBoard() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection(collectionName)
          .orderBy(boardDateTime, descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: Text("Loading"));
          default:
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                padding: const EdgeInsets.fromLTRB(45, 100, 45, 50),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, i) =>
                    (buildCard(context, snapshot.data.documents[i])));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    return _buildBoard();
  }

  Widget buildCard(BuildContext context, DocumentSnapshot document) {
    getNickname(context, document);

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: InkWell(
          onLongPress: () {
            if (document['authorId'] == fp.getUser().uid) {
              showUpdateOrDeleteDialog(document);
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    content: new Text("No permission"),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          onTap: () {
            showJoinDialog(document);
          },
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              // image: new DecorationImage(
              //   fit: BoxFit.cover,
              //   colorFilter: new ColorFilter.mode(
              //       Colors.black.withOpacity(0.2), BlendMode.dstATop),
              //   image: new ExactAssetImage('images/study.jpg'),
              // ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      document['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'BMHANNA',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                        child: Text(DateFormat('yyyy-MM-dd - kk:mm')
                            .format(document['dateTime'].toDate()))),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        document['author'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3a4c47),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
