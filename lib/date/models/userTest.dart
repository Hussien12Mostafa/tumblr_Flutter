// ignore_for_file: file_names, unused_label
import 'package:http/http.dart';
class UserTest {
  String? name;
  String? imageUrl;
  Map<String, int>? blogsId;
  Map<String, int>? favoriteBlogs;
  Map<String, int>? followingBlogs;
  Map<String, int>? followersBlogs;
  Map<String, int>? likesPostsId;
  Map<String, int>? blockingBlogsId;
  String? email;
  int? age;
  String? password;
  UserTest({
    required this.name,
    required this.imageUrl,
    required this.blogsId,
    required this.favoriteBlogs,
    required this.followersBlogs,
    required this.followingBlogs,
    required this.age,
    required this.blockingBlogsId,
    required this.email,
    required this.likesPostsId,
    required this.password,
  });
   UserTest.fromJson(Map<String, dynamic> json) {
  blogsId: json["blogsId"];
  favoriteBlogs: json["favorite_blogs"];
  followingBlogs: json["job"];
 
  followersBlogs: json["followers_blogs"];
  likesPostsId: json["likes_posts_id"];
  blockingBlogsId:json["blocking_blogs_id"];
     name: json["name"];
     email: json["email"];
     age: json["age"];
     password: json["password"];
   }
}



 
