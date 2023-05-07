import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyModel with ChangeNotifier {
  int _month = DateTime.now().month;
  int get month => _month;

  set month(int value) {
    if (value <= 0) value = 1;
    if (value > 12) value = 12;
    _month = value;
    notifyListeners();
  }
}
