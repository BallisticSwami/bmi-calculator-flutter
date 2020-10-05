import 'package:bmi_calculator/constants/size_config.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardColor, this.cardChild, this.onTap});

  final Color cardColor;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
        margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.7),
        child: cardChild,
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3)),
      ),
    );
  }
}
