// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:addpost/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:addpost/main.dart';

void main() {
  // Build our app and trigger a frame.
  test('empty editor restults in disabling the post button ', () {
    var result = checkisdisabled.isdisabledfunction('');
    expect(result, true);
  });

  test('null editor restults in disabling the post button ', () {
    var result = checkisdisabled.isdisabledfunction(null);
    expect(result, true);
  });

  test('Not empty editor restults in enabling the post button ', () {
    var result = checkisdisabled.isdisabledfunction('my text');
    expect(result, false);
  });
}
