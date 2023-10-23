import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class Bottom extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  const Bottom({Key? key, required this.buttonTitle, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: KBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KBottomContainerHeight,
        child: Center(
          child: Text(buttonTitle, style: KButtonStyle),
        ),
      ),
    );
  }
}
