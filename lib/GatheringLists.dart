import 'package:flutter/material.dart';
import 'package:Moim/model/Board.dart';

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

List<Board> boards = [
  Board(
      'Looking for StudyGroup',
      'hyojin',
      'im looking for study group for job interview and prefer software company',
      'blahblah'),
];

class GatheringLists extends StatefulWidget {
  @override
  GatheringListsState createState() => GatheringListsState();
}

class GatheringListsState extends State<GatheringLists> {
  //final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 24.0);

  Widget _buildRow(Board board) {
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: new ExactAssetImage('images/study.jpg'),
          ),
        ),
        child: ListTile(
          title: Text(
            board.title,
            style: _biggerFont,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: boards.length,
      itemBuilder: (context, i) {
        //print(i);
        //if (i.isOdd) return Divider();

        //final index = i ~/ 2;
        //print(index);
        // if (i >= _suggestions.length) {
        //   _suggestions.addAll(lists);
        // }
        // if (i >= lists.length) {
        //   return null;
        // }
        return _buildRow(boards[i]);
      },
    );
  }
}
