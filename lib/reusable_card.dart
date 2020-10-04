import 'package:bmi_calculator/size_config.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardColor, this.cardChild});

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.7),
      child: cardChild,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3)),
    );
  }
}
