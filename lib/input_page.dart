import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'size_config.dart';

const Color activeCardColor = Color(0xff1D1E33);
const Color accentButton = Color(0xffEE4266);
const Color cardTextColor = Color(0xff8D8E98);
const Color inactiveCardColor = Color(0xff111328);

enum Gender { male, female }

Gender selectedGender = Gender.male;

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
                        onTap: () {
                          setState(() {
                        if (selectedGender == Gender.male) {
                          selectedGender = Gender.female;
                        } else {
                          selectedGender = Gender.male;
                        }
                      }
                          );},
                        cardColor: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild:
                            GenderCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
                      )),
                  Expanded(
                      child: ReusableCard(
                        onTap: () {
                          setState(() {
                        if (selectedGender == Gender.female) {
                          selectedGender = Gender.male;
                        } else {
                          selectedGender = Gender.female;
                        }
                      }
                          );},
                        cardColor: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: GenderCard(
                            icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                      )),
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
                  Expanded(child: ReusableCard(cardColor: activeCardColor)),
                  Expanded(child: ReusableCard(cardColor: activeCardColor)),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: SizeConfig.safeBlockVertical * 8.7,
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
