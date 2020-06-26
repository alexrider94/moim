// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:file_picker/file_picker.dart';

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
  // TextEditingController controllerNickname = TextEditingController();
  // TextEditingController controllerAboutMe = TextEditingController();

  // SharedPreferences prefs;

  String nickname = '';
  //String photoUrl = '';

  // bool isLoading = false;
  //File avatarImageFile;

  // final FocusNode focusNodeNickname = FocusNode();
  // final FocusNode focusNodeAboutMe = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   readLocal();
  // }

  // void readLocal() async {
  //   prefs = await SharedPreferences.getInstance();
  //   id = prefs.getString('id') ?? '';
  //   nickname = prefs.getString('nickname') ?? '';
  //   photoUrl = prefs.getString('photoUrl') ?? '';

  //   controllerNickname = TextEditingController(text: nickname);

  //   // Force refresh input
  //   setState(() {});
  // }

  // Future getImage() async {
  //   File image = await FilePicker.getFile();

  //   if (image != null) {
  //     setState(() {
  //       avatarImageFile = image;
  //       isLoading = true;
  //     });
  //   } else
  //     return false;
  //   uploadFile();
  // }

  // Future uploadFile() async {
  //   String fileName = id;
  //   StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
  //   StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
  //   StorageTaskSnapshot storageTaskSnapshot;
  //   uploadTask.onComplete.then((value) {
  //     if (value.error == null) {
  //       storageTaskSnapshot = value;
  //       storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
  //         photoUrl = downloadUrl;
  //         Firestore.instance.collection('users').document(id).updateData(
  //             {'nickname': nickname, 'photoUrl': photoUrl}).then((data) async {
  //           await prefs.setString('photoUrl', photoUrl);
  //           setState(() {
  //             isLoading = false;
  //           });
  //           Fluttertoast.showToast(msg: "Upload success");
  //         }).catchError((err) {
  //           setState(() {
  //             isLoading = false;
  //           });
  //           Fluttertoast.showToast(msg: err.toString());
  //         });
  //       }, onError: (err) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         Fluttertoast.showToast(msg: 'This file is not an image');
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       Fluttertoast.showToast(msg: 'This file is not an image');
  //     }
  //   }, onError: (err) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Fluttertoast.showToast(msg: err.toString());
  //   });
  // }

  // void handleUpdateData() {
  //   focusNodeNickname.unfocus();
  //   focusNodeAboutMe.unfocus();

  //   setState(() {
  //     isLoading = true;
  //   });

  //   Firestore.instance.collection('users').document(id).updateData(
  //       {'nickname': nickname, 'photoUrl': photoUrl}).then((data) async {
  //     await prefs.setString('nickname', nickname);
  //     await prefs.setString('photoUrl', photoUrl);

  //     setState(() {
  //       isLoading = false;
  //     });

  //     Fluttertoast.showToast(msg: "Update success");
  //   }).catchError((err) {
  //     setState(() {
  //       isLoading = false;
  //     });

  //     Fluttertoast.showToast(msg: err.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Avatar
                // Container(
                //   child: Center(
                //     child: Stack(
                //       children: <Widget>[
                //         (avatarImageFile == null)
                //             ? (photoUrl != ''
                //                 ? Material(
                //                     child: CachedNetworkImage(
                //                       placeholder: (context, url) => Container(
                //                         child: CircularProgressIndicator(
                //                           strokeWidth: 2.0,
                //                           valueColor:
                //                               AlwaysStoppedAnimation<Color>(
                //                                   Colors.white),
                //                         ),
                //                         width: 90.0,
                //                         height: 90.0,
                //                         padding: EdgeInsets.all(20.0),
                //                       ),
                //                       imageUrl: photoUrl,
                //                       width: 90.0,
                //                       height: 90.0,
                //                       fit: BoxFit.cover,
                //                     ),
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(45.0)),
                //                     clipBehavior: Clip.hardEdge,
                //                   )
                //                 : Icon(
                //                     Icons.account_circle,
                //                     size: 90.0,
                //                     color: Colors.white,
                //                   ))
                //             : Material(
                //                 child: Image.file(
                //                   avatarImageFile,
                //                   width: 90.0,
                //                   height: 90.0,
                //                   fit: BoxFit.cover,
                //                 ),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(45.0)),
                //                 clipBehavior: Clip.hardEdge,
                //               ),
                //         IconButton(
                //           icon: Icon(
                //             Icons.camera_alt,
                //             color: Colors.green[100].withOpacity(0.5),
                //           ),
                //           onPressed: () => {}, //getImage,
                //           padding: EdgeInsets.all(30.0),
                //           splashColor: Colors.transparent,
                //           highlightColor: Colors.white,
                //           iconSize: 30.0,
                //         ),
                //       ],
                //     ),
                //   ),
                //   width: double.infinity,
                //   margin: EdgeInsets.all(20.0),
                // ),

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
                    onPressed: () => {},
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

          // Loading
          // Positioned(
          //   child: isLoading
          //       ? Container(
          //           child: Center(
          //             child: CircularProgressIndicator(
          //                 valueColor:
          //                     AlwaysStoppedAnimation<Color>(Colors.black)),
          //           ),
          //           color: Colors.white.withOpacity(0.8),
          //         )
          //       : Container(),
          // ),
        ],
      ),
    );
  }
}
