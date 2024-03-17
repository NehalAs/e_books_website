import 'package:e_books_website/modules/shared/utils/app_ui.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.function,
      required this.text,
      this.width = 400,
      this.background,
      this.isUppercase = true,
      this.radius = 0.0});

  double width;
  Color? background;
  Function() function;
  bool isUppercase;
  String text;
  double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:background?? AppUI.buttonColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
