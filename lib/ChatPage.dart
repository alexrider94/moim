import 'package:Moim/ChatRoom.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:Moim/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  void quitGroupChat(FirebaseProvider fp, DocumentSnapshot doc) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Container(
            height: 200,
            child: Text("Do you want to quit?"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Quit Group"),
              onPressed: () {
                DatabaseService()
                    .deleteUserFromChatRoom(fp.getUser().uid, doc.documentID);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseProvider fp = Provider.of<FirebaseProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text("YOUR GROUP CHAT"),
      ),
      body: buildChatRoomList(fp),
    );
  }

  Widget buildChatRoomList(FirebaseProvider fp) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('ChattingRoom')
          .where('users', arrayContains: fp.getUser().uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: Text("Loading"));
          case ConnectionState.none:
            return Center(child: Text("NO CHAT"));
          default:
            if (snapshot.data.documents.length != null) {
              return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(45, 40, 45, 50),
                  itemCount: snapshot.data.documents.length == null
                      ? 0
                      : snapshot.data.documents.length,
                  itemBuilder: (context, i) => buildChatRoom(
                      context, i, snapshot.data.documents[i], fp));
            } else {
              return Center(child: Text("NO CHAT"));
            }
        }
      },
    );
  }

  Widget buildChatRoom(BuildContext context, int index, DocumentSnapshot doc,
      FirebaseProvider fp) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: InkWell(
        onTap: () async {
          String nickname;
          await DatabaseService()
              .getUserNickname(fp.getUser().uid)
              .then((value) {
            nickname = value;
          });
          print(nickname);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatRoom(doc.documentID, nickname)),
          );
        },
        onLongPress: () {
          quitGroupChat(fp, doc);
        },
        child: Container(
          child: ListTile(
            title: Text(
              doc['title'].toString(),
              style: TextStyle(
                fontFamily: 'BMHANNA',
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
