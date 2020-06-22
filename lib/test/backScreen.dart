import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  return WillPopScope(
    onWillPop: _onBackPressed,
    child: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "On Back pressed",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Center(
        child: new Text("Home Page"),
      ),
    ),
  );
}
