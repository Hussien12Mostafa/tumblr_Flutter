import 'package:tumbler/date/models/user.dart';

class Post {
  final String data;
  final int numOfNotes;
  final int numOfLikes;
  final int numOfReblog;
  final Map<User, String> m;
  Post({
    required this.data,
    required this.numOfNotes,
    required this.numOfLikes,
    required this.numOfReblog,
    required this.m,
  });
}
