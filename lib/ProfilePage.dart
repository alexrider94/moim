import 'package:Moim/FireBaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  FirebaseProvider fp;
  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text(
              'CHANGE PROFILE',
              style: TextStyle(
                  fontFamily: 'BMHANNA', fontSize: 20, color: Colors.black),
            ),
            onTap: () => {},
          ),
        ),
        Card(
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
    );
  }
}
