import 'package:flutter/material.dart';
import 'size_config.dart';
import 'globals.dart';

ThemeData myTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Color(0xff0a0e21),
  scaffoldBackgroundColor: Color(0xff0a0e21),
);

class MyThemePack {

  static double safeBlockHz;
  static double safeBlockVt;


  void initBlock(BuildContext context) {
    SizeConfig().init(context);
    safeBlockHz = SizeConfig.safeBlockHorizontal;
    safeBlockVt = SizeConfig.safeBlockVertical;
  }

  static TextStyle labelTextStyle = TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4.2,
            color: cardTextColor,
          );

  static TextStyle cardNumberStyle = TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 14,
            fontWeight: FontWeight.w900
          );
}
