// ignore_for_file: file_names

import 'package:tumbler/date/models/user.dart';

class LikesAndReblog {
  User s;
  String likeOrReblog;
  LikesAndReblog({required this.likeOrReblog, required this.s});
}

List<LikesAndReblog> toListLike(Map<User, String> m) {
  List<LikesAndReblog> c = [];
  m.forEach((k, v) => c.add(LikesAndReblog(s: k, likeOrReblog: v)));
  return c;
}
