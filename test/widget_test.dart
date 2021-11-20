// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

class LikeTest {
  static String likeTest(bool isLike) {
    if (isLike == false) {
      return 'remove from list LikesPost';
    } else {
      return 'added to list LikesPost';
    }
  }
}

class TextAddComment {
  static String textAddComment(String? comment) {
    if (comment == null || comment == '') {
      return 'Do not add comment';
    } else {
      return 'added comment';
    }
  }
}

void main() {
  test('test comment string if empty do not make anything ', () {
    var result = TextAddComment.textAddComment('');
    expect(result, 'Do not add comment');
  });
  test('test comment string if null do not make anything ', () {
    var result = TextAddComment.textAddComment(null);
    expect(result, 'Do not add comment');
  });
  test('test comment string if has comment add it ', () {
    var result = TextAddComment.textAddComment('hello this is good image');
    expect(result, 'added comment');
  });
  test('test like if true he  likes post', () {
    var result = LikeTest.likeTest(true);
    expect(result, 'added to list LikesPost');
  });
  test('test like if false he does not like post', () {
    var result = LikeTest.likeTest(false);
    expect(result, 'remove from list LikesPost');
  });
}
