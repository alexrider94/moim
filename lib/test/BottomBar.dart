import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  InkWell _buildButtonColumn(
      Color color, IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () => {
        if (label == 'BOARD')
          {}
        else if (label == 'CHAT')
          {pageCallback(label)}
        else if (label == 'ACCOUNT')
          {pageCallback(label)}
        else
          print('error')
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.indigo[300];
    return Container(
      color: Colors.lime[200],
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(
            color,
            Icons.view_day,
            'BOARD',
            context,
          ),
          _buildButtonColumn(color, Icons.chat, 'CHAT', context),
          _buildButtonColumn(color, Icons.account_circle, 'ACCOUNT', context)
        ],
      ),
    );
  }
}

void pageCallback(String pageName) {}
