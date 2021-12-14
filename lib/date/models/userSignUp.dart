// ignore_for_file: file_names, unused_label
import 'package:http/http.dart';
class UserSignUp {
  String? name;
  String? email;
  int? age;
  String? password;
  UserSignUp({
    required this.name,
    
    required this.age,
    
    required this.email,
    
    required this.password,
  });
   UserSignUp.fromJson(Map<String, dynamic> json) {
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
Map<String, dynamic> toJson() => {
    "Email": this.email,
    "Password": this.password,
    "Blog_Name": this.name,
    "Age": this.age,
  };
}




 
