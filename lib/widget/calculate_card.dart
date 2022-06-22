import 'package:flutter/material.dart';

class CalculateCard extends StatelessWidget {
  String text;
  Color colorText;
  Color backgroundColor;
  Function()? onTap;
  Icon? icon;

  CalculateCard({
   required this.text,
    this.colorText = Colors.black,
    this.backgroundColor=Colors.white,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Card(
          color: backgroundColor,
          margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: icon??Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorText),
            ),
          ),
        ),
      ),
    );
  }
}
