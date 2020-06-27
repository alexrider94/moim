import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userSettingCollection =
      Firestore.instance.collection('userSetting');
  final CollectionReference chattingRoomCollection =
      Firestore.instance.collection('ChattingRoom');
  final CollectionReference boardCollection =
      Firestore.instance.collection('Board');
  Future makeChatRoom(
      String title, String boardId, String nickname, String userId) async {
    return await chattingRoomCollection.document(boardId).setData({
      'title': title,
      'admin': userId,
      'users': FieldValue.arrayUnion([userId])
    });
  }

  Future deleteChatRoom(String boardId, String userId) async {
    return await chattingRoomCollection.document(boardId).delete();
  }

  Future updateChatRoom(String boardId, String title) async {
    return await chattingRoomCollection
        .document(boardId)
        .updateData({'title': title});
  }

  Future addUserInChatRoom(
      String getUserId, String nickname, String getChatId) async {
    return await chattingRoomCollection.document(getChatId).updateData({
      'users': FieldValue.arrayUnion([getUserId])
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

  Future changeNickname(String getBoardId, String nickname) async {
    return await boardCollection.document(getBoardId).updateData({
      'author': nickname,
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
