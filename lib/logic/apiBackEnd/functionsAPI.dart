// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/emailLogIn.dart';
import 'package:tumbler/date/models/password.dart';
import 'package:tumbler/date/models/userSignUp.dart';

final String emailSignInUrl = "https://reqres.in/api/users";
final String emailPasswordUrl = "https://reqres.in/api/users";
// "http://tumblr4u.eastus.cloudapp.azure.com:5000/login";
final String googleSignInUrl = "https://reqres.in/api/users";
final String signUpUrl =
    //  "https://dd839c69-b7f2-411a-8182-9dce818037d1.mock.pstmn.io";
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/signup";
final String forgetPasswordUrl = "https://reqres.in/api/users";
Future<AutoLoginModel?> emailSignIn(String gmail) async {
  final response = await http.post(Uri.parse(emailSignInUrl), body: {
    "email": gmail,
  });

  if (response.statusCode == 201) {
    final jsonData = json.decode(response.body);
    return autoLoginModelFromJson(response.body);
    return null;
  } else {
    return null;
  }
}

Future<bool?> checkSignInUser(String email, String password) async {
  print("inside1");
  Map<String, String> s1 = {"email": email, "password": password};
  print(s1);
  final response = await http.post(Uri.parse(emailPasswordUrl), body: s1);
  print("done req1");
  print("body=" + response.body);
  final responseString = response.body;

  return true;

  return false;
}

Future<AutoLoginModel?> googleSignIn(String email) async {
  final response = await http.post(Uri.parse(googleSignInUrl), body: {
    "email": email,
  });

  if (response.statusCode == 201) {
    final responseString = response.body;
    return autoLoginModelFromJson(responseString);
  } else {
    return null;
  }
}

Future<bool?> signUp(String email, String password, String name) async {
  print("inside");
  Map<String, String> s = {
    "email": "hussienmostafa@gmail.com",
    "password": "password1234",
    "blogName": "7essen",
    "age": "25"
  };
  print(s);
  final response = await http.post(Uri.parse(signUpUrl), body: s);
  print("done");
  print(jsonDecode(response.body));
  var body = jsonDecode(response.body);

  print(response.body);

  return true;

  print(body["meta"]["msg"]);
  return false;

  return false;
}

Future<AutoLoginModel?> forgetPassword(String email) async {
  final response = await http.post(Uri.parse(forgetPasswordUrl), body: {
    "email": email,
  });

  if (response.statusCode == 201) {
    final responseString = response.body;
    return autoLoginModelFromJson(responseString);
  } else {
    return null;
  }
}
