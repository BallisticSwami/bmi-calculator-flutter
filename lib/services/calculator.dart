import 'dart:math';
import 'package:bmi_calculator/constants/globals.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, this.age, this.gender});

  final int height;
  final int weight;
  final int age;
  final Gender gender;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getTip() {
    String tip = 'For ages 20+, BMI incorporates weight and height, but it does not take age or sex into account.\n\nA woman tends to have more body fat than a man with the same BMI. Likewise, an older person tends to have more body fat than a younger person with an equal BMI.\n\nHence, BMI may not be accurate.';

    if(age > 20 || gender == Gender.female) {
      return tip;
    }
    else {
      return 'null';
    }
  }
}
