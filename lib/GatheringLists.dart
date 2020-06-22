import 'package:flutter/material.dart';

List<String> lists = [
  'Anyone who want to practice interview with me?',
  'Looking for Algorithms study in korea',
  'Join my Job interview study',
  'TESTTSETSTSTETSETSETESTSET',
  'ASDFASDFASDFASDFASDF',
  '테스트 게시글입니다. 111111',
  '테스트 게시글입니다. 22222',
  '테스트 게시글입니다. 33333',
  '테스트 게시글입니다. 44444',
  '테스트 게시글입니다. 55555',
  '테스트 게시글입니다. 6666',
  '테스트 게시글입니다. 777777777',
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
        if (index >= lists.length) {
          return null;
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
}
