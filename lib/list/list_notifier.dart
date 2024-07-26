import 'package:flutter/material.dart';

/// A ChangeNotifier class to manage the list data.
///
/// This class allows adding items to the list and notifies listeners
/// about changes in the list data.
class ListNotifier with ChangeNotifier {
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
