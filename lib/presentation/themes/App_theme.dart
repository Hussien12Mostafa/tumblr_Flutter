// ignore_for_file: file_names, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: const TextStyle(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
                 enabledBorder: InputBorder.none,
      hintStyle: TextStyle(
        fontSize: 20,
      ),
    ),
    
  );
}
