
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  /// decrement 
  void decrement(){
    counter--;
    notifyListeners();
  }
}