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

/// A ChangeNotifier class to manage the list data.
///
/// This class allows adding items to the list and notifies listeners
/// about changes in the list data.
class ListModel with ChangeNotifier {
  /// Internal list of strings.
  final List<String> _list = ["Sample"];

  /// Getter to retrieve the list data.
  List<String> get listDatas => _list;

  /// Adds a new value to the list and notifies listeners.
  ///
  /// [value] The value to be added to the list.
  void addToList(String value) {
    _list.add(value);
    notifyListeners();
  }
}
