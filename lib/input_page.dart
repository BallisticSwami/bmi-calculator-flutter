import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'size_config.dart';
import 'globals.dart';
import 'theme.dart';

enum Gender { male, female }
enum Operation { add, subtract }

Gender selectedGender = Gender.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;

  Function changeWeight(Operation operation) {
    return () {
      setState(() {
      if(operation == Operation.add) {
        weight++;
      }
      else {
        weight--;
      }
    });
    };
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.8),
          ),
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
                          Text(height.toString(),
                              style: MyThemePack.cardNumberStyle),
                          Text(
                            'cm',
                            style: MyThemePack.labelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: MyThemePack().getMySliderTheme(context),
                        child: Slider(
                          value: height.toDouble(),
                          min: 50,
                          max: 300,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
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
                  Expanded(
                      child: ReusableCard(
                    cardColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: MyThemePack.labelTextStyle),
                        Text(
                          weight.toString(),
                          style: MyThemePack.cardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: changeWeight(Operation.add),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: changeWeight(Operation.subtract),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
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
