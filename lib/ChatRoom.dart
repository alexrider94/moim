import 'package:Moim/ChatMessage.dart';
import 'package:Moim/database.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String chatRoomId;
  final String userNickname;
  ChatRoom(this.chatRoomId, this.userNickname);
  @override
  State createState() => new ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  TextEditingController messageController = new TextEditingController();

  Stream chatMessageStream;

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": widget.userNickname,
        "time": DateTime.now().millisecondsSinceEpoch
      };

      DatabaseService().addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = "";
    }
  }

  @override
  void initState() {
    DatabaseService().getConversationMessages(widget.chatRoomId).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });
    super.initState();
  }

  Widget chatMessageList() {
    return StreamBuilder(
        stream: chatMessageStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ChatMessage(
                        snapshot.data.documents[index].data["message"],
                        snapshot.data.documents[index].data["sendBy"] ==
                            widget.userNickname,
                        snapshot.data.documents[index].data["sendBy"]);
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: new AppBar(
        title: Text('Group Chat'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          //Message ui
          chatMessageList(),
          //Message sending ui
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Message...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(12),
                          child: new Icon(Icons.arrow_back)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
