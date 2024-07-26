import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberModel with ChangeNotifier {
  int _number = 0;

  int get newNumber => _number;

  void increment() {
    _number++;
    notifyListeners();
  }
}
