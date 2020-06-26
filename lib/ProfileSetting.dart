import 'package:Moim/FireBaseProvider.dart';
import 'package:Moim/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          'SETTINGS',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ProfileSettingScreen(),
    );
  }
}

class ProfileSettingScreen extends StatefulWidget {
  @override
  State createState() => ProfileSettingScreenState();
}

class ProfileSettingScreenState extends State<ProfileSettingScreen> {
  static FirebaseProvider fp;
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    return Container(
      color: Colors.green[100],
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Input
                Column(
                  children: <Widget>[
                    // Username
                    Container(
                      child: Text(
                        'Nickname',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      margin:
                          EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                    ),
                    Container(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(primaryColor: Colors.white),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Put your Nickname',
                            contentPadding: EdgeInsets.all(5.0),
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          //controller: controllerNickname,
                          onChanged: (value) {
                            nickname = value;
                          },
                          //focusNode: focusNodeNickname,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),

                // Button
                Container(
                  child: FlatButton(
                    onPressed: () => {
                      DatabaseService()
                          .updateUserData(fp.getUser().uid, nickname),
                      Navigator.pop(context)
                    },
                    child: Text(
                      'UPDATE',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    color: Colors.green[300],
                    highlightColor: Color(0xff8d93a0),
                    splashColor: Colors.transparent,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  ),
                  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
          ),
        ],
      ),
    );
  }
}
