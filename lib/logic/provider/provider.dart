import 'package:flutter/material.dart';


class TasksProvider with ChangeNotifier {
  
  Future<void> updateTask() async {

    notifyListeners();
  }
}
