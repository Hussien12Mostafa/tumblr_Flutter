// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_declarations

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/emailLogIn.dart';
import 'package:tumbler/date/models/post.dart';

final String emailSignInUrl = "https://reqres.in/api/users";
final String emailPasswordUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/login";
final String googleSignInUrl = "https://reqres.in/api/users";
final String signUpUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/signup";
final String forgetPasswordUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/users";
final String makeCommentUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/:blogId/:postId/comment";
final String likeBlogPostUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/:blogId/:postId/like_post";
final String removeCommentUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/:blogId/:postId/like_post";
final String getBlogUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/blog/view";
final String getCommentsUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/posts";
final String dashboardUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/dashboard";
final String autoCompleteSearchUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/autoCompleteSearchDash";

Future<AutoLoginModel?> emailSignIn(String gmail) async {
  final response = await http.post(Uri.parse(emailSignInUrl), body: {
    "email": gmail,
  }, headers: {
    "Content-Type": "application/json"
  });

  if (response.statusCode == 201) {
    final jsonData = json.decode(response.body);
    return autoLoginModelFromJson(response.body);
    return null;
  } else {
    return null;
  }
}

Future<String> checkSignInUser(String email, String password) async {
  print("inside1");
  Map<String, String> s1 = {"email": email, "password": password};
  print(s1);
  final response = await http.post(
    Uri.parse(emailPasswordUrl),
    headers: {"Content-Type": "application/json"},
    body: json.encode(s1),
  );
  print("body=" + response.body);
  var body = jsonDecode(response.body);
  if (response.statusCode == 200)
    return body["res"]["message"];
  else
    return body["res"]["error"];
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

Future<bool> signUp(String email, String password, String name) async {
  Map<String, String> s = {
    "email": email,
    "password": password,
    "blogName": name,
    "age": ageInScreen
  };

  final response = await http.post(
    Uri.parse(signUpUrl),
    headers: {"Content-Type": "application/json"},
    body: json.encode(s),
  );

  var body = jsonDecode(response.body);

  if (body["meta"]["msg"] == "CREATED") return true;

  return false;
}

Future<bool?> forgetPassword(String email) async {
  final response = await http.post(Uri.parse(forgetPasswordUrl), body: {
    "email": email,
  });

  return true;
}

Future<String?> makeComment(String blogID, String postID, String text) async {
  Map<String, dynamic> m = {"blogId": blogID, "postId": postID, "text": text};
  final response = await http.post(
    Uri.parse(makeCommentUrl),
    headers: {"Content-Type": "application/json"},
    body: json.encode(m),
  );
  var body = jsonDecode(response.body);
  if (response.statusCode == 200) return body["res"]["commentId"];

  return null;
}

Future<bool> likeBlogPost(String blogID, String postID) async {
  Map<String, dynamic> m = {
    "blogId": blogID,
    "postId": postID,
  };
  final response = await http.put(
    Uri.parse(likeBlogPostUrl),
    headers: {"Content-Type": "application/json"},
    body: json.encode(m),
  );
  var body = jsonDecode(response.body);
  if (response.statusCode == 200) return true;

  return false;
}

Future<bool> removeComment(String commentID, String postID) async {
  Map<String, dynamic> m = {
    "blogId": commentID,
    "postId": postID,
  };
  final response = await http.post(
    Uri.parse(removeCommentUrl),
    headers: {"Content-Type": "application/json"},
    body: json.encode(m),
  );
  var body = jsonDecode(response.body);
  if (response.statusCode == 200) return true;

  return false;
}

Future<Map<String, dynamic>?> getComments(String postID) async {
  final response = await http.get(
      Uri.parse(getCommentsUrl + "/" + "61ae667d8b4d5620ce937992" + "/notes"),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);

    Map<String, dynamic> l = body;
    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> dashboard(String token) async {
  final response = await http.get(
    Uri.parse(dashboardUrl),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    Map<String, dynamic> l = body;

    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> getBlog(String blogId) async {
  final response = await http.get(
    Uri.parse(getBlogUrl + "/" + "61c2ebd23135b522106a78fa"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("got blog");
    Map<String, dynamic> l = body;

    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> autoCompleteSearch(String word) async {
  final response = await http.get(
    Uri.parse(autoCompleteSearchUrl + "/" + word),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    Map<String, dynamic> l = body;

    return l;
  }

  return null;
}
