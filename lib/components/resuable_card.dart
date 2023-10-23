import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color colors;
  final VoidCallback? onPressed;
  final Widget cardChild;

  const ReusableCard(
      {super.key,
      required this.colors,
      required this.cardChild,
       this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors,
        ),
        margin: const EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}


