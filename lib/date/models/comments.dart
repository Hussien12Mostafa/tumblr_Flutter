import 'package:tumbler/date/models/user.dart';

class CommentsData {
  User s;
  String comment;
  CommentsData({required this.s, required this.comment});
}

List<CommentsData> toList(Map<User, String> m) {
  List<CommentsData> c = [];
  m.forEach((k, v) => c.add(CommentsData(s: k, comment: v)));
  return c;
}
