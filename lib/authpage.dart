import 'package:flutter/material.dart';
import 'package:Moim/firebase_provider.dart';
import 'package:Moim/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:Moim/main_page.dart';

AuthPageState pageState;

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    pageState = AuthPageState();
    return pageState;
  }
}

class AuthPageState extends State<AuthPage> {
  FirebaseProvider fp;

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    logger.d("user: ${fp.getUser()}");
    //세션유지 체크.
    if (fp.getUser() != null && fp.getUser().isEmailVerified == true) {
      return MainPage();
    } else {
      return SignInPage();
    }
  }
}
