import 'package:bmi_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderCard({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: SizeConfig.safeBlockHorizontal * 20),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 2,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4.2,
            color: cardTextColor,
          ),
        )
      ],
    );
  }
}