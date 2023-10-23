import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/iconbutton.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/button.dart';
import '../components/resuable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  void minusWeight() {
    setState(() {
      weight--;
    });
  }

  void addWeight() {
    setState(() {
      weight++;
    });
  }

  void minusAge() {
    setState(() {
      age--;
    });
  }

  void addAge() {
    setState(() {
      age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            "BMI CALCULATOR",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            //row with 2 containers
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //first container
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colors: selectedGender == Gender.male
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild: const IconContent(
                        label: "Male", icons: FontAwesomeIcons.mars),
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                //second container
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colors: selectedGender == Gender.female
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild: const IconContent(
                      icons: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),

          //height container with slider
          ReusableCard(
            colors: KActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Height", style: KlabelTextStyle),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("${height.toInt()}", style: KnumberStyle),
                    const Text(
                      "cm",
                      style: KlabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: const Color(0x29EB1555),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: const Color(0xFFEB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          //row with 2 containers
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //first container
                  child: ReusableCard(
                    colors: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: minusWeight,
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: addWeight),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //second container
                Expanded(
                  child: ReusableCard(
                    colors: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: minusAge),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus, onPressed: addAge)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //calculate button
          Bottom(
              buttonTitle: "CALCULATE",
              onPressed: () {
                //user must select gender if not display error message
                if (selectedGender != null) {
                  CalculateBmi calc =
                      CalculateBmi(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult(),
                        ),
                      ));
                } else {
                  Fluttertoast.showToast(
                    msg: "You must Select Your Gender",
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.grey,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                }
              }),
        ],
      ),
    );
  }
}
