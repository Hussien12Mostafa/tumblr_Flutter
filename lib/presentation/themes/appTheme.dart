// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkMode = ThemeData();
  static final ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.blue[900],
    ),
    iconTheme: IconThemeData(color: Colors.grey[700], size: 20),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.blue,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff0c234a),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Merrweather',
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xffbdbec0),
      backgroundColor: Color(0xff0c234a),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 14, color: Colors.grey[800]),
      bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      headline1: TextStyle(fontSize: 18,color: Colors.white,fontWeight:FontWeight.normal),
      headline2: TextStyle(fontSize: 18,color: Colors.black,fontWeight:FontWeight.normal),
      headline3: TextStyle(fontWeight:FontWeight.normal),
    ),
  );
}
