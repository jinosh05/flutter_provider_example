import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NumberModel with ChangeNotifier {
  int _number = 0;

  int get newNumber => _number;

  void increment() {
    _number++;
    notifyListeners();
  }
}

class ListModel with ChangeNotifier {
  List<String> _list = [" Sample"];

  List get listDatas => _list;

  void addToList(String value) {
    _list.add(value);
    notifyListeners();
  }
}
