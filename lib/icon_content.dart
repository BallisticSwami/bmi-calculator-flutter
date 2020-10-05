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

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: SizeConfig.safeBlockHorizontal*4.3,),
      shape: CircleBorder(),
      elevation: SizeConfig.safeBlockHorizontal * 2,
      constraints: BoxConstraints.tightFor(
        width: SizeConfig.safeBlockHorizontal * 13,
        height: SizeConfig.safeBlockHorizontal * 13,
      ),
      fillColor: cardButtonColor,
      onPressed: onPressed,
    );
  }
}