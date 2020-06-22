import 'package:equatable/equatable.dart';

abstract class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({this.id, this.title, this.body});

  @override
  String toString() => 'Post { id: $id }';
}
