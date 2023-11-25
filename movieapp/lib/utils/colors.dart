import 'package:flutter/material.dart';

class CustomColors{
    static Color primaryColor = const Color.fromRGBO(242, 243, 245, 1);

  static Color primaryButtonColor = const Color.fromRGBO(222, 81, 36, 1);

  static Color textColor = const Color.fromRGBO(34, 34, 34, 1);
  static Color secondaryColor = const Color.fromRGBO(99, 0, 163, 1);
  static Color secondaryColorLight = const Color.fromRGBO(208, 145, 250, 1);

  static Color backgroundColor = const Color.fromRGBO(246, 246, 250, 1);

  static Color fillcolor = const Color.fromRGBO(255, 255, 255, 1);
  static Color onAppBarColor = const Color.fromRGBO(239, 239, 239, 1);
  static Color greyIconColor = const Color.fromRGBO(130,125,136,1);
  static Color blueTextColor = const Color.fromRGBO(96,195,242,1);

  static Color greenBackgroundColor = const Color.fromRGBO(102, 255, 204, .1);
 

   static Color ligtpinkGradiant = const Color.fromRGBO(0, 0 ,0, 0);
  static Color violetgradient = const Color.fromRGBO(0, 0, 0, 1);

  static LinearGradient lineargradient = LinearGradient(
    colors: [
      ligtpinkGradiant,
      violetgradient,
    ],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
  );
}