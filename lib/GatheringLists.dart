import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:provider/provider.dart';

class GatheringLists extends StatefulWidget {
  @override
  GatheringListsState createState() => GatheringListsState();
}

class GatheringListsState extends State<GatheringLists> {
  final _biggerFont = const TextStyle(fontSize: 24.0);
  static FirebaseProvider fp;
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final String collectionName = 'Board';
  final String boardTitle = 'title';
  final String boardDateTime = 'dateTime';
  final String boardAuthorName = 'admin';

  TextEditingController _undTitleCon = TextEditingController();

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
                onPressed: () {
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
  void updateDoc(String docID, String name) {
    Firestore.instance
        .collection(collectionName)
        .document(docID)
        .updateData({boardTitle: name});
  }

  // 문서 삭제 (Delete)
  void deleteDoc(String docID) {
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
            return Text("Loading..");
          default:
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.all(8.0),
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
    return Card(
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
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: new ExactAssetImage('images/study.jpg'),
            ),
          ),
          child: ListTile(
            title: Text(
              //board.title,
              document['title'],
              style: _biggerFont,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
