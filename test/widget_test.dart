// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:tumbler/logic/functions/checkAge.dart';
import 'package:tumbler/logic/functions/checkIsDisablePost.dart';
import 'package:tumbler/logic/functions/commentFieldCheck.dart';
import 'package:tumbler/logic/functions/like.dart';
import 'package:tumbler/presentation/screens/logInScreens/emailLogIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/whatShouldWeCall.dart';







void main() {
  test('test comment string if above age', () {
    var result = checkAge(20);
    expect(result, true);
  });

    test('test comment string if under age', () {
    var result = checkAge(10);
    expect(result, false);
  });

  test("what happens when given no mail", () {
    var result = DoesMailExist('');
    expect(result, false);
  });

  test("test comment to see what happens if given a registered mail", () {
    var result = DoesMailExist("hussienmostafa8888@gmail.com");
    expect(result, true);
  });

  test("test comment to see what happens if given wrong mail", () {
    var result = DoesMailExist('wrongemailaddress');
    expect(result, false);
  });

  test("Given an Empty email", () {
    var result = EmailNotEmpty('');
    expect(result, false);
  });

  test("When Given a mail address", () {
    var result = EmailNotEmpty('something');
    expect(result, true);
  });

  test("Given an Empty password", () {
    var result = PasswordNotEmpty('');
    expect(result, false);
  });

  test("Given a password", () {
    var result = PasswordNotEmpty('123456789');
    expect(result, true);
  });

  test("Given no Name", () {
    var result = NameNotEmpty('');
    expect(result, false);
  });

  test("Given a Name", () {
    var result = NameNotEmpty('hello');
    expect(result, true);
  });
  test('test comment string if empty do not make anything ', () {
    var result = commentsCheck('');
    expect(result, false);
  });
  test('test comment string if null do not make anything ', () {
    var result = commentsCheck(null );
    expect(result, false);
  });
  test('test comment string if has comment add it ', () {
    var result =  commentsCheck('hello this is good image');
    expect(result, true);
  });
  test('test like if true he  likes post', () {
    var result = likeTest(true);
    expect(result, true);
  });
  test('test like if false he does not like post', () {
    var result = likeTest(false);
    expect(result, false);
  });
  test('empty editor restults in disabling the post button ', () {
    var result = isdisabledfunction('');
    expect(result, true);
  });
  test('empty editor restults in disabling the post button ', () {
    var result = isdisabledfunction('');
    expect(result, true);
  });

  test('null editor restults in disabling the post button ', () {
    var result = isdisabledfunction(null);
    expect(result, true);
  });

  test('Not empty editor restults in enabling the post button ', () {
    var result = isdisabledfunction('my text');
    expect(result, false);
  });
}
