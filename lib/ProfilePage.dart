import 'package:Moim/FireBaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Moim/ProfileSetting.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  FirebaseProvider fp;
  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text("PROFLE PAGE"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
        children: <Widget>[
          Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'CHANGE PROFILE',
                style: TextStyle(
                    fontFamily: 'BMHANNA', fontSize: 20, color: Colors.black),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileSetting()))
              },
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'RESET PASSWORD',
                style: TextStyle(
                    fontFamily: 'BMHANNA',
                    fontSize: 20,
                    color: Colors.deepOrange[100]),
              ),
              onTap: () => {fp.sendPasswordResetEmailByEnglish()},
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'SIGN OUT',
                style: TextStyle(
                    fontFamily: 'BMHANNA',
                    fontSize: 20,
                    color: Colors.deepOrange[200]),
              ),
              onTap: () => {fp.signOut()},
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'DELETE ACCOUNT',
                style: TextStyle(
                    fontFamily: 'BMHANNA', fontSize: 20, color: Colors.red),
              ),
              onTap: () => {fp.withdrawalAccount()},
            ),
          ),
        ],
      ),
    );
  }
}
