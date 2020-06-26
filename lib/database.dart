import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userSettingCollection =
      Firestore.instance.collection('userSetting');

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

  Future getUserData() async {
    return userSettingCollection.document(uid).get();
  }

  Future check() async {
    final snapShot = await userSettingCollection.document(uid).get();
    if (snapShot == null || !snapShot.exists) {
      return false;
    }
    return true;
  }
}
