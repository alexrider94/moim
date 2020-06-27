import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userSettingCollection =
      Firestore.instance.collection('userSetting');
  final CollectionReference chattingRoomCollection =
      Firestore.instance.collection('ChattingRoom');

  Future makeChatRoom(String title, String boardId, String admin) async {
    return await chattingRoomCollection
        .document(boardId)
        .setData({'title': title, 'users': [], 'admin': admin});
  }

  Future addUserInChatRoom(
      String getUserId, String nickname, String getChatId) async {
    return await chattingRoomCollection.document(getChatId).updateData({
      'users': FieldValue.arrayUnion([
        {'nickname': nickname, 'userId': getUserId}
      ])
    });
  }

  Future makeUserData(String nickname) async {
    return await userSettingCollection.document(uid).setData({
      'nickname': nickname,
    });
  }

  Future updateUserData(String getId, String nickname) async {
    return await userSettingCollection.document(getId).updateData({
      'nickname': nickname,
    });
  }

  getUserNickname(String getId) async {
    String nick;
    await userSettingCollection.document(getId).get().then((doc) {
      nick = doc.data['nickname'];
    });
    return nick;
  }

  Future check() async {
    final snapShot = await userSettingCollection.document(uid).get();
    if (snapShot == null || !snapShot.exists) {
      return false;
    }
    return true;
  }
}
