import 'package:tumbler/date/models/user.dart';

class Post {
  final String data;
  User ownerPost;
  int numOfLikes;
  int numOfReblog;
  Map<int, Map<User, String>> m;
  Map<User, String> likesThisPost;
  Post({
    required this.ownerPost,
    required this.data,
    required this.numOfLikes,
    required this.numOfReblog,
    required this.m,
    required this.likesThisPost,
  });
}
