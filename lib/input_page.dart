import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'size_config.dart';
import 'globals.dart';
import 'theme.dart';

enum Gender { male, female }

Gender selectedGender = Gender.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      });
                    },
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
                      });
                    },
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
                child: ReusableCard(
                  cardColor: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: MyThemePack.labelTextStyle,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(height.toString(), style: MyThemePack.cardNumberStyle),
                          Text(
                            'cm',
                            style: MyThemePack.labelTextStyle,
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 50,
                        max: 300,
                        activeColor: accentButton,
                        inactiveColor: Color(0xff3c3e5c),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },

                      ),
                    ],
                  ),
                ),
              ),
            ),
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
