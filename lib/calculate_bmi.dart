import 'dart:math';


class CalculateBmi {
  CalculateBmi({required this.height, required this.weight,});

  final int height;
  final int weight;
  double get _bmi => weight/pow(height/100,2);

  // Calculates BMI and returns it as a formatted string.
  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }
  // Returns a result label based on BMI.
  String getResult() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
  // Provides an interpretation based on BMI.
  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more";
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
