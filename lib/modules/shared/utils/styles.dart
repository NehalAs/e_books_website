import 'package:flutter/material.dart';

import 'app_ui.dart';

abstract class Styles {
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // semi-bold
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
  );

  static const textStyle17 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,// semi-bold
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w100,
    color: Colors.black,
    wordSpacing: 1,
    height: 1.7,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color:AppUI.blackColor,

  );

  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal, // semi-bold
    color: AppUI.searchHintColor,
  );
  static const textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal, // semi-bold
  );
  static const textStyle8 = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w500, // semi-bold
  );
}