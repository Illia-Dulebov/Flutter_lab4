import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int currentIndex = 0;

  void changeNum(int num) {
    this.currentIndex = num;
    print(this.currentIndex);
    notifyListeners();
  }

  set currentIndexNum(int num) => currentIndex = num;
  int get currentIndexNum => currentIndex;

  CountModel(this.currentIndex);
}
