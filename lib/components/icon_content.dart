import 'package:bmi_calculator/Constants/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String  label;
  final IconData icons;

  const IconContent({super.key,  required this.label, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style:  KlabelTextStyle,
        ),
      ],
    );
  }
}
