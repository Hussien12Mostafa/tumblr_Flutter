
import 'package:test/test.dart';
import 'package:tumbler/logic/functions/checkAge.dart';
import 'package:tumbler/logic/functions/checkIsDisablePost.dart';
import 'package:tumbler/logic/functions/commentFieldCheck.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/logic/functions/isNameValid.dart';
import 'package:tumbler/logic/functions/isPasswordValid.dart';
import 'package:tumbler/logic/functions/like.dart';

void main() {
  test('test comment string if email is invalid', () {
    var result = isEmailValid('adadwadawda');
    expect(result, "Enter a Valid email");
  });
  test('test comment result = null if email is invalid', () {
    var result = isEmailValid(null);
    expect(result, "Email required");
  });
  test('test comment result = null if email is invalid', () {
    var result = isEmailValid('xowslow@gmail.com');
    expect(result, null);
  });

  test('test comment returns string if no input', () {
    var result = isNameValid('');
    expect(result, "Enter a name");
  });

  test('test comment returns null if given an input', () {
    var result = isNameValid('givennamebro');
    expect(result, null);
  });

  test('returns string if given no password', () {
    var result = isPasswordValid('');
    expect(result, "Required Password");
  });

  test('returns string if given  password less than 8', () {
    var result = isPasswordValid('fathy:S');
    expect(result, "Password is at least 8 characters");
  });

  test('returns null if given  password more than 7', () {
    var result = isPasswordValid('wdawdaodmamwdas');
    expect(result, null);
  });
  test('test comment string if above age', () {
    var result = checkAge("20");
    expect(result, null);
  });

  test('test comment string if under age', () {
    var result = checkAge("10");
    expect(result, "You're too young for this");
  });

  test('test comment string if empty do not make anything ', () {
    var result = commentsCheck('');
    expect(result, false);
  });
  test('test comment string if null do not make anything ', () {
    var result = commentsCheck(null);
    expect(result, false);
  });
  test('test comment string if has comment add it ', () {
    var result = commentsCheck('hello this is good image');
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
    var result = isDisAbleFunction('');
    expect(result, true);
  });
  test('empty editor restults in disabling the post button ', () {
    var result = isDisAbleFunction('');
    expect(result, true);
  });

  test('null editor restults in disabling the post button ', () {
    var result = isDisAbleFunction(null);
    expect(result, true);
  });

  test('Not empty editor restults in enabling the post button ', () {
    var result = isDisAbleFunction('my text');
    expect(result, false);
  });
}
