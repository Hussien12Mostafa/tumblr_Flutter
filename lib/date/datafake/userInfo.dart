// ignore_for_file: file_names, prefer_const_constructors

import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/date/models/user.dart';
import 'package:flutter/material.dart';

List<Post> posts = [];
List<String> interestedUser = [];
Blog? blogUser;

User? user;

late final String ageInScreen;
String token=
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFobWVkLmF5bWFuLjE0MjBAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2NDA3MjAzMDd9.s8CKUqFg2q3q9rQKQz5jYAHZLi1nJfyx6ifsFs0ac2g";

bool signIn = false;
Blog userBlodId = Blog(
    id: "61c9e2100ea834c610490b64",
    title: "hussien",
    avatar:
        "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80",
    accent: "red",
    headerImage: "default",
    background: "default",
    blockedBlogs: [],
    followers: [],
    privacy: false,
    name: "nour00",
    updated: 0,
    description: "This is my Blog",
    password: "password",
    isBlockedFromPrimary: false,
    isPrimary: false,
    blogVisitor: 0,
    followedTags: [],
    postsIds: [],
    isDeleted: false,
    v: 23);

bool isLogIn = false;
List<Color> colors = [
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.lightGreen,
  Colors.transparent,
  Colors.grey,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.yellowAccent
];
