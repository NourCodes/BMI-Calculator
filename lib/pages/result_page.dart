import 'package:bmi_calculator/Constants/constants.dart';
import 'package:bmi_calculator/components/resuable_card.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class Result extends StatelessWidget {
   const Result({Key? key, required this.bmiResult, required this.resultText, required this.interpretation}) : super(key: key);

  final String resultText;
  final String bmiResult;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text("Your Result", style: KTitleStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colors: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: KResultTextStyle,
                  ),
                  Text(
                      bmiResult, style: KBMITextStyle
                  ),
                  Text(
                      interpretation,
                      style: KBodyTextStyle, textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
          ),
          Bottom(
              buttonTitle: "RE-CALCULATE",
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
