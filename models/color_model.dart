import 'package:flutter/material.dart';
import 'dart:math';

class StateColor extends ChangeNotifier {
  Color color;

  void changeRandomColor() {
    var rng = new Random();
    int? choose = rng.nextInt(3);

    if (choose == 1) {
      this.color = Colors.red;
    } else if (choose == 2) {
      this.color = Colors.blue;
    } else {
      this.color = Colors.indigo;
    }
    notifyListeners();
  }

  set colorB(Color colorVal) => color = colorVal;
  Color get colors => color;

  StateColor(this.color);
}
