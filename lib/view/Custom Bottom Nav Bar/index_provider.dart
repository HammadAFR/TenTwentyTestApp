import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int _index = 2;

  int get index => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  bool _isWatchScreen = true;
  bool get isWatchScreen => _isWatchScreen;

  void toggleIsWatchScreen(bool val) {
    _isWatchScreen = val;
    notifyListeners();
  }
}
