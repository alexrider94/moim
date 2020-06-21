import 'package:flutter/material.dart';

List<String> lists = [
  '오늘 배드민턴 칠 사람 구합니다.',
  '알고리즘 스터디 모임 구합니다',
  '취업 면접 스터디 할사람?',
  '취업동아리 인원 모집 7월전까지 공모전 참여할 사람',
];

class GatheringLists extends StatefulWidget {
  @override
  GatheringListsState createState() => GatheringListsState();
}

class GatheringListsState extends State<GatheringLists> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(lists);
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
}

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              //TOP BAR
              Container(
                color: Colors.green[200],
                width: MediaQuery.of(context).size.width,
                height: 80,
              ),
              //MAIN SECTOR
              Container(
                color: Colors.green[50],
                height: MediaQuery.of(context).size.height - 160,
                width: MediaQuery.of(context).size.width,
                child: GatheringLists(),
              ),
              //BOTTOM BAR
              Container(
                color: Colors.teal[100],
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButtonColumn(color, Icons.view_day, 'SEARCH'),
                    _buildButtonColumn(color, Icons.chat, 'CHAT'),
                    _buildButtonColumn(color, Icons.account_circle, 'ACCOUNT')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
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
    );
  }
}
