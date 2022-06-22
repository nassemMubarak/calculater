import 'package:flutter/material.dart';

class CalculaterGet extends StatelessWidget {
  String text;
  Color colorText;
  Color backgroundColorText;
  Function()? onTape;
  Icon? icon;
  CalculaterGet({
    required this.text,
     this.colorText=Colors.black,
    this.backgroundColorText=Colors.white,
     this.onTape,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTape??(){},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: backgroundColorText,
          border:
              Border.fromBorderSide(BorderSide(width: 1, color: Colors.teal.withOpacity(0.5))),
        ),
        child: icon??Text(
          text,
          style: TextStyle(color: colorText),
        ),
      ),
    );
  }
}
