// ignore_for_file: unused_local_variable

import 'package:tumbler/date/models/user.dart';

class CommentsData {
  User s;
  String comment;
  CommentsData({required this.s, required this.comment});
}

List<CommentsData> toList(Map<int, Map<User, String>> m) {
  List<CommentsData> c = [];
  Map<User, String> m1;

  m.forEach((k, v) {
    v.forEach((j,l)=>c.add(CommentsData(s: j, comment: l)));
    
  }
  );

  return c;
}
