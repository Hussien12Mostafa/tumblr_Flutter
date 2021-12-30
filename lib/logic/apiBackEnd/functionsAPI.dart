// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_declarations

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/emailLogIn.dart';

final String emailSignInUrl = "https://reqres.in/api/users";
final String emailPasswordUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/login";
final String googleSignInUrl = "https://reqres.in/api/users";
final String signUpUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/signup";
final String forgetPasswordUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/users";
final String makeCommentUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String likeBlogPostUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String removeCommentUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String getBlogUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/blog/view";
final String getCommentsUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String dashboardUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/dashboard";
final String autoCompleteSearchUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/autoCompleteSearchDash";
final String uploadImagesUrl =
    "http://tumblr4u.eastus.cloudapp.azure.com:5000/uploadImg";
final String showPostUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String deletePostUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String createPostUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
final String editPostUrl = "http://tumblr4u.eastus.cloudapp.azure.com:5000";
Future<AutoLoginModel?> emailSignIn(String gmail) async {
  final response = await http.post(Uri.parse(emailSignInUrl), body: {
    "email": gmail,
  }, headers: {
    "Content-Type": "application/json"
  });

  if (response.statusCode == 201) {
    final jsonData = json.decode(response.body);
    token = jsonData[""][""];
    return autoLoginModelFromJson(response.body);
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

  print(response.body);
  if (response.statusCode == 201) {
    var body = jsonDecode(response.body);
    print("token=$token");
    token = body["res"]["data"];
    print(body["res"]["data"]);
    print("token=$token");
    getUserInterest(interestedUser);
    return true;
  }
  return false;
}

Future<bool?> makeComment(String blogID, String postID, String text) async {
  Map<String, dynamic> m = {"text": text};

  final response = await http.put(
    Uri.parse(makeCommentUrl + "/" + blogID + "/" + postID + "/comment"),
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode(m),
  );
  var body = jsonDecode(response.body);
  if (response.statusCode == 200) return true;

  return false;
}

Future<bool> likeBlogPost(String blogID, String postID) async {
  final response = await http.put(
      Uri.parse(likeBlogPostUrl + "/" + blogID + "/" + postID + "/like_press"),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  var body = jsonDecode(response.body);
  print(body);
  if (response.statusCode == 200) return true;

  return false;
}

Future<String?> removeComment(String commentID, String postID) async {
  final response = await http.delete(
    Uri.parse(
        removeCommentUrl + "/" + postID + "/" + commentID + "/remove_comment"),
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  print('after call');
  print(response.body);
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    print(body);
    String l = body;

    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> getComments(String noteID) async {
  final response = await http
      .get(Uri.parse(getCommentsUrl + "/" + noteID + "/notes"), headers: {
    "Content-Type": "application/json",
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    print("1");
    var body = jsonDecode(response.body);
    if (body == "Notes Not Found") return null;
    Map<String, dynamic> l = body;
    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> dashboard(String t) async {
 
 
    print("inside here");
   final response = await http.get(
      Uri.parse(dashboardUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );
 
  print(response.body);
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    Map<String, dynamic> l = body;

    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> getBlog(String blogId) async {
  final response = await http.get(
    Uri.parse(getBlogUrl + "/" + blogId),
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

Future<Map<String, dynamic>?> autoCompleteSearchForMainScreen() async {
  final response = await http.get(
    Uri.parse(autoCompleteSearchUrl),
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

Future<Map<String, dynamic>?> uploadImages(List<String> l) async {
  Map<String, List<String>> s = {"file": l};

  final response = await http.post(Uri.parse(uploadImagesUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(s));
  print("res======${response.body}");
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    Map<String, dynamic> l = body;

    return l;
  }

  return null;
}

Future<Map<String, dynamic>?> showPosts(String postId) async {
  final response = await http.get(
    Uri.parse(showPostUrl + "/" + postId + "/" + "show_post"),
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

Future<String?> deletePosts(String postId) async {
  final response = await http.delete(
    Uri.parse(deletePostUrl + "/" + postId + "/" + "delete_post"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    String l = body;

    return l;
  }

  return null;
}

Future<String?> createPosts(String blogId, String postHtml) async {
  print("inside create");
  Map<String, dynamic> l = {
    "postHtml": postHtml,
    "type": "text",
    "state": "published"
  };
  final response = await http.post(
      Uri.parse(createPostUrl + "/" + blogId + "/" + "create_post"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(l));

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    String l = body;

    return l;
  }

  return null;
}

Future<String?> createPostsWithTag(
    String blogId, String postHtml, String tag) async {
  Map<String, dynamic> l = {
    "postHtml": postHtml,
    "type": "text",
    "state": "published",
    "tags": tag
  };
  final response = await http.post(
      Uri.parse(createPostUrl + "/" + blogId + "/" + "create_post"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(l));

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    String l = body;

    return l;
  }

  return null;
}

Future<String?> editPosts(String postId, String postHtml) async {
  Map<String, dynamic> l = {
    "postHtml": postHtml,
  };
  final response = await http.put(
      Uri.parse(createPostUrl + "/" + postId + "/" + "edit_post"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(l));

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("response 200");
    String l = body;

    return l;
  }

  return null;
}

Future getUserInterest(List<String> interest) async {
  print(interest[0]);
  Map<String, dynamic> s = {"interests": interest};
  final response = await http.post(
    Uri.parse(
        "http://tumblr4u.eastus.cloudapp.azure.com:5000/getInterestsFromUser"),
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode(s),
  );
  print("body=" + response.body);
  if (response.statusCode == 200) {
    print("It works");
  } else {
    print("Error");
  }
}

Future forgotPass(String email) async {
  Map<String, dynamic> s = {
    "email": email,
  };
  final response = await http.post(
    Uri.parse(
        "http://tumblr4u.eastus.cloudapp.azure.com:5000/user/forget_password"),
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
    },
    body: jsonEncode(s),
  );

  print("body=" + response.body);
  if (response.statusCode == 200) {
    print("It works");
  } else {
    print("Error");
  }
}
