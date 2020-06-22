import 'package:flutter/material.dart';
import 'package:Moim/GatheringLists.dart';

DashBoardState pageState;

class DashBoard extends StatefulWidget {
  @override
  DashBoardState createState() {
    pageState = DashBoardState();
    return pageState;
  }
}

class DashBoardState extends State<DashBoard> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      height: MediaQuery.of(context).size.height - 120,
      width: MediaQuery.of(context).size.width,
      child: GatheringLists(),
    );
  }
}
