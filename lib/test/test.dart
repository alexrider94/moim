import 'package:flutter/material.dart';
import 'package:Moim/FireBaseProvider.dart';
import 'package:provider/provider.dart';

SignedInPageState pageState;

class SignedInPage extends StatefulWidget {
  @override
  SignedInPageState createState() {
    pageState = SignedInPageState();
    return pageState;
  }
}

class SignedInPageState extends State<SignedInPage> {
  FirebaseProvider fp;
  TextStyle tsItem = const TextStyle(
      color: Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold);
  TextStyle tsContent = const TextStyle(color: Colors.blueGrey, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    double propertyWith = 130;
    return Scaffold(
      appBar: AppBar(title: Text("Singed In Page")),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: <Widget>[
                //Hader
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(
                    child: Text(
                      "Signed In User Info",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // User's Info Area
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 1),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("UID", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().uid, style: tsContent),
                          )
                        ],
                      ),
                      Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Email", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().email, style: tsContent),
                          )
                        ],
                      ),
                      Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Name", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().displayName ?? "",
                                style: tsContent),
                          )
                        ],
                      ),
                      Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Phone Number", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().phoneNumber ?? "",
                                style: tsContent),
                          )
                        ],
                      ),
                      Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("isEmailVerified", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().isEmailVerified.toString(),
                                style: tsContent),
                          )
                        ],
                      ),
                      Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Provider ID", style: tsItem),
                          ),
                          Expanded(
                            child:
                                Text(fp.getUser().providerId, style: tsContent),
                          )
                        ],
                      ),
                    ].map((c) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: c,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),

          // Sign In Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              color: Colors.indigo[300],
              child: Text(
                "SIGN OUT",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.signOut();
              },
            ),
          ),

          // Send Password Reset Email by English
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: RaisedButton(
              color: Colors.orange[300],
              child: Text(
                "Send Password Reset Email by English",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.sendPasswordResetEmailByEnglish();
              },
            ),
          ),

          // Send Password Reset Email by Korean
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: RaisedButton(
              color: Colors.orange[300],
              child: Text(
                "Send Password Reset Email by Korean",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.sendPasswordResetEmailByKorean();
              },
            ),
          ),

          // Send Password Reset Email by Korean
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: RaisedButton(
              color: Colors.red[300],
              child: Text(
                "Withdrawal (Delete Account)",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.withdrawalAccount();
              },
            ),
          ),
        ],
      ),
    );
  }
}
