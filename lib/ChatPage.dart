import 'package:Moim/FireBaseProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseProvider fp = Provider.of<FirebaseProvider>(context);
    return buildChatRoomList(fp);
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
                  padding: const EdgeInsets.fromLTRB(45, 100, 45, 50),
                  itemCount: snapshot.data.documents.length == null
                      ? 0
                      : snapshot.data.documents.length,
                  itemBuilder: (context, i) =>
                      buildChatRoom(context, i, snapshot.data.documents[i]));
            } else {
              return Center(child: Text("NO CHAT"));
            }
        }
      },
    );
  }

  Widget buildChatRoom(BuildContext context, int index, DocumentSnapshot doc) {
    return InkWell(
        onTap: () {},
        child: Container(
          child: ListTile(
            title: Text(doc['title'].toString()),
          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
