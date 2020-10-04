import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'size_config.dart';

Color mainCardBg = Color(0xff1D1E33);
Color accentButton = Color(0xffEE4266);
Color cardTextColor = Color(0xff8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2),
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    cardColor: mainCardBg,
                    cardChild:
                        GenderCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  )),
                  Expanded(child: ReusableCard(cardColor: mainCardBg, cardChild: GenderCard(icon: FontAwesomeIcons.venus, text: 'FEMALE'),)),
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                decoration: BoxDecoration(
                    color: Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 3)),
              ),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2),
              child: Row(
                children: [
                  Expanded(child: ReusableCard(cardColor: mainCardBg)),
                  Expanded(child: ReusableCard(cardColor: mainCardBg)),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: SizeConfig.safeBlockVertical * 8.2,
              decoration: BoxDecoration(
                  color: accentButton,
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(SizeConfig.safeBlockHorizontal * 3),
                      topRight:
                          Radius.circular(SizeConfig.safeBlockHorizontal * 3))),
            )
          ],
        ));
  }
}



