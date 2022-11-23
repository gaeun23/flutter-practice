import 'package:flutter/material.dart';

class Scores with ChangeNotifier {
  int midTermExam = 30;
  int finalExam = 30;

  void decreaseMidTerm() {
    midTermExam -= 1;
    notifyListeners();
  }

  void increaseMidTerm() {
    midTermExam += 1;
    notifyListeners();
  }

  void decreaseFinal() {
    finalExam -= 1;
    notifyListeners();
  }

  void increaseFinal() {
    finalExam += 1;
    notifyListeners();
  }
}

class DetailedScores with ChangeNotifier {
  int additionalMidTerm = 10;
  int additionalFinal = 10;
}
