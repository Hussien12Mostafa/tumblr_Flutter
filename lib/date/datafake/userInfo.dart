// ignore_for_file: file_names, prefer_const_constructors

import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/date/models/user.dart';
import 'package:flutter/material.dart';
Blog? blogUser;
  User? user;
late final String ageInScreen;
String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJlZW0uYXRhbGE1NTVAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2MzkwNzk5MTl9.ZH_PhZ04bFeoRQoXqOE4hyJ7PCNIEzdDDOKYteNqEDs";
bool signIn = false;
Blog userBlodId = Blog(
    id: "619",
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
final List<Blog> blog = [
  Blog(
      id: "6",
      title: "noor",
      avatar:
          "https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
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
      v: 23),
  Blog(
      id: "61b33c94c4bab40beeb82b6f",
      title: "noor",
      avatar: "avatar.jpg",
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
      v: 23),
  Blog(
      id: "61b33c94c4bab40beeb82b6f",
      title: "noor",
      avatar: "avatar.jpg",
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
      v: 23),
];
final List<Post> posts = [
  Post(
      id: "61b3aa8fe9eb14e9d9917e4c",
      blogId: "619957113df6b45019c42d06",
      postHtml:
          """post text <span style="color:red;">is here</span> <br> <img src="https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/11/06/17/mohamed-salah.jpg?width=982&height=726" /> 
""",
      type: "link",
      state: "published",
      tags: ["cmp"],
      notesId: "61b3aa8fe9eb14e9d9917e4b",
      v: 0),
  Post(
      id: "61b3aa8fe9eb14e9d9917e4c",
      blogId: "619957113df6b45019c42d06",
      postHtml:
          """ <span>Hi</span> <br> <img src="https://wishmemorning.com/wp-content/uploads/2021/01/Sunflower-Post-Featured-Image.jpg" /> 
""",
      type: "link",
      state: "published",
      tags: ["cmp"],
      notesId: "61b3aa8fe9eb14e9d9917e4b",
      v: 0),
  Post(
      id: "61b3aa8fe9eb14e9d9917e4c",
      blogId: "619957113df6b45019c42d06",
      postHtml: "<hi/>",
      type: "link",
      state: "published",
      tags: ["cmp"],
      notesId: "61b3a81495cdb3f384ba76c1",
      v: 0),
  Post(
      id: "61b3aa8fe9eb14e9d9917e4c",
      blogId: "619957113df6b45019c42d06",
      postHtml:
          """ <span>Hi</span> <br> <img src="https://wishmemorning.com/wp-content/uploads/2021/01/Sunflower-Post-Featured-Image.jpg" /> 
""",
      type: "link",
      state: "published",
      tags: ["cmp"],
      notesId: "61b3a7ae95cdb3f384ba76bb",
      v: 0)
];
// final List<User> onlineUsers = [
//   User(
//     name: 'David Brooks',
//     imageUrl:
//         'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Jane Doe',
//     imageUrl:
//         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Matthew Hinkle',
//     imageUrl:
//         'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
//   ),
//   User(
//     name: 'Amy Smith',
//     imageUrl:
//         'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
//   ),
//   User(
//     name: 'Ed Morris',
//     imageUrl:
//         'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
//   ),
//   User(
//     name: 'Carolyn Duncan',
//     imageUrl:
//         'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Paul Pinnock',
//     imageUrl:
//         'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
//   ),
//   User(
//       name: 'Elizabeth Wong',
//       imageUrl:
//           'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
//   User(
//     name: 'James Lathrop',
//     imageUrl:
//         'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
//   ),
//   User(
//     name: 'Jessie Samson',
//     imageUrl:
//         'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'David Brooks',
//     imageUrl:
//         'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Jane Doe',
//     imageUrl:
//         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Matthew Hinkle',
//     imageUrl:
//         'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
//   ),
//   User(
//     name: 'Amy Smith',
//     imageUrl:
//         'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
//   ),
//   User(
//     name: 'Ed Morris',
//     imageUrl:
//         'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
//   ),
//   User(
//     name: 'Carolyn Duncan',
//     imageUrl:
//         'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
//   User(
//     name: 'Paul Pinnock',
//     imageUrl:
//         'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
//   ),
//   User(
//       name: 'Elizabeth Wong',
//       imageUrl:
//           'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
//   User(
//     name: 'James Lathrop',
//     imageUrl:
//         'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
//   ),
//   User(
//     name: 'Jessie Samson',
//     imageUrl:
//         'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//   ),
// ];
List<dynamic> ll = [
  [
    "61968c974f161173940ea9cb",
    "619957113df6b45019c42d07",
    "619957113df6b45019c42d06"
  ],
  [
    {
      "commentingBlogId": "8",
      "commentingBlogTitle": "Untitled",
      "text": "Very Good Post",
      "_id": "61b4c9cefe269d262d31b09f"
    }
  ],
  [
    {
      "rebloggingId": "619957113df6b45019c42d06",
      "text": "helloo",
      "_id": "61b4a97b7e8f4de43c449374"
    }
  ],
  [3, 8, 31]
];
List<String> likesUsers = ll[0];
List<Map<String, dynamic>> commentsPost = ll[1];
List<Map<String, dynamic>> reBlogPost = ll[2];
List<int> counts = ll[3];
List<Map> l1 = [
  {
    'title': 't1',
    'name': 'n1',
    'img': 'https://lledogrupo.com/wp-content/uploads/2018/04/user-img-1.png'
  },
  {
    'title': 't2',
    'name': 'n2',
    'img':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZgU21GiP99cA9p4mfI2T0ymnLChSyxBSqYMfHSjtZAKL9k3-RajjfKAFY2FfrMCXs7wo&usqp=CAU'
  },
  {
    'title': 't3',
    'name': 'n3',
    'img':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1hbGV8ZW58MHx8MHx8&w=1000&q=80'
  },
  {
    'title': 't3',
    'name': 'n3',
    'img':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1hbGV8ZW58MHx8MHx8&w=1000&q=80'
  },
  {
    'title': 't3',
    'name': 'n3',
    'img':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1hbGV8ZW58MHx8MHx8&w=1000&q=80'
  },
  {
    'title': 't3',
    'name': 'n3',
    'img':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1hbGV8ZW58MHx8MHx8&w=1000&q=80'
  }
];
// User currentUser = User(
//     name: 'HussienMostafa',
//     imageUrl:
//         'https://mir-s3-cdn-cf.behance.net/project_modules/1400/d1191d41834581.5607082148f50.jpg');
bool isLogIn = false;
List<Color> colors = [
  Colors.amber,
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.indigo,
  Colors.pink
];
