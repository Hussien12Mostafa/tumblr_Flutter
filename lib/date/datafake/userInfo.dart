// ignore_for_file: file_names, prefer_const_constructors

import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/date/models/user.dart';

final List<User> onlineUsers = [
  User(
    name: 'David Brooks',
    imageUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Jane Doe',
    imageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Matthew Hinkle',
    imageUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'Amy Smith',
    imageUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'Ed Morris',
    imageUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Paul Pinnock',
    imageUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      name: 'Elizabeth Wong',
      imageUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    name: 'James Lathrop',
    imageUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    name: 'Jessie Samson',
    imageUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'David Brooks',
    imageUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Jane Doe',
    imageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Matthew Hinkle',
    imageUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'Amy Smith',
    imageUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'Ed Morris',
    imageUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Paul Pinnock',
    imageUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      name: 'Elizabeth Wong',
      imageUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    name: 'James Lathrop',
    imageUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    name: 'Jessie Samson',
    imageUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];
final List<Post> postsData = [
  Post(
    ownerPost: onlineUsers[0],
    data:
        """post text <span style="color:red;">is here</span> <br> <img src="https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/11/06/17/mohamed-salah.jpg?width=982&height=726" /> 
""",
    numOfLikes: 3,
    numOfReblog: 1,
    m: {
      0: {onlineUsers[0]: "bla bla"},
      1: {onlineUsers[1]: "why"},
      2: {onlineUsers[2]: "i dot know"},
      3: {onlineUsers[3]: "ok"},
      4: {onlineUsers[4]: "good"},
      5: {onlineUsers[5]: "fine"},
      6: {onlineUsers[0]: "bla bla"},
      7: {onlineUsers[8]: "very good"},
      8: {onlineUsers[9]: "that is good"},
      9: {onlineUsers[10]: "good"},
      10: {onlineUsers[0]: "bla bla"},
      11: {onlineUsers[12]: "oh my god"},
      12: {onlineUsers[13]: "again"},
    },
    likesThisPost: {
      onlineUsers[1]: 'like',
      onlineUsers[2]: 'reblog',
      onlineUsers[3]: 'like',
      onlineUsers[4]: 'like'
    },
  ),
  Post(
    ownerPost: onlineUsers[0],
    data:
        """ <span>Hi</span> <br> <img src="https://wishmemorning.com/wp-content/uploads/2021/01/Sunflower-Post-Featured-Image.jpg" /> 
""",
    numOfLikes: 10,
    numOfReblog: 1,
    m: {
      0: {onlineUsers[0]: "good morning"},
      1: {onlineUsers[1]: "hi"},
      2: {onlineUsers[2]: "good morning"},
      3: {onlineUsers[3]: "good morning"},
      4: {onlineUsers[4]: "good morning"},
      5: {onlineUsers[5]: "good morning"},
      6: {onlineUsers[0]: "good morning"},
      7: {onlineUsers[8]: "good morning"},
      8: {onlineUsers[9]: "good morning"},
      9: {onlineUsers[10]: "good morning"},
      10: {onlineUsers[0]: "good morning"},
      11: {onlineUsers[12]: "good morning"},
      12: {onlineUsers[13]: "good morning"},
    },
    likesThisPost: {
      onlineUsers[1]: 'like',
      onlineUsers[2]: 'reblog',
      onlineUsers[3]: 'like',
      onlineUsers[4]: 'like',
      onlineUsers[5]: 'like',
      onlineUsers[6]: 'like',
      onlineUsers[7]: 'like',
      onlineUsers[8]: 'like',
      onlineUsers[9]: 'like',
      onlineUsers[10]: 'like',
      onlineUsers[11]: 'like',
    },
  ),
  Post(
    ownerPost: onlineUsers[0],
    data:
        """ <span>Hi</span> <br> <img src="https://wishmemorning.com/wp-content/uploads/2021/01/Sunflower-Post-Featured-Image.jpg" /> 
""",
    numOfLikes: 10,
    numOfReblog: 1,
    m: {
      0: {onlineUsers[0]: "good morning"},
      1: {onlineUsers[1]: "hi"},
      2: {onlineUsers[2]: "good morning"},
      3: {onlineUsers[3]: "good morning"},
      4: {onlineUsers[4]: "good morning"},
      5: {onlineUsers[5]: "good morning"},
      6: {onlineUsers[0]: "good morning"},
      7: {onlineUsers[8]: "good morning"},
      8: {onlineUsers[9]: "good morning"},
      9: {onlineUsers[10]: "good morning"},
      10: {onlineUsers[0]: "good morning"},
      11: {onlineUsers[12]: "good morning"},
      12: {onlineUsers[13]: "good morning"},
      13: {onlineUsers[13]: "bbbbbbbbbb"},
    },
    likesThisPost: {
      onlineUsers[1]: 'like',
      onlineUsers[2]: 'reblog',
      onlineUsers[3]: 'like',
      onlineUsers[4]: 'like',
      onlineUsers[5]: 'like',
      onlineUsers[6]: 'like',
      onlineUsers[7]: 'like',
      onlineUsers[8]: 'like',
      onlineUsers[9]: 'like',
      onlineUsers[10]: 'like',
      onlineUsers[11]: 'like',
    },
  ),
];
User currentUser = User(
    name: 'HussienMostafa',
    imageUrl:
        'https://mir-s3-cdn-cf.behance.net/project_modules/1400/d1191d41834581.5607082148f50.jpg');
bool isLogIn=false;
