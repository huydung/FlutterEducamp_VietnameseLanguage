import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/BirthYearInfo.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/ScrollingNumericPicker.dart';
import 'package:Vietnamese_and_Flutter_Educamp/models/CoupleMatchModel.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class BirthYearSelectionWidget extends StatefulWidget {
  final Person forPerson;

  final Function(Person person) updatePersonInfo;

  BirthYearSelectionWidget(
      {@required this.forPerson, @required this.updatePersonInfo});

  @override
  _BirthYearSelectionWidgetState createState() =>
      _BirthYearSelectionWidgetState(forPerson);
}

class _BirthYearSelectionWidgetState extends State<BirthYearSelectionWidget> {
  Person _person;

  _BirthYearSelectionWidgetState(this._person);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSmallMargin),
      margin: EdgeInsets.fromLTRB(kSmallMargin, kSmallMargin, kSmallMargin, 0),
      decoration: BoxDecoration(
        color: kHDIBGColor,
        borderRadius: BorderRadius.circular(kSmallMargin),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: BirthYearInfo(
                  initialPerson: _person,
                  alignment: CrossAxisAlignment.start,
                  buttonsEnabled: true,
                  onGenderSelected: (gender) {
                    _person.gender = gender;
                    if (widget.updatePersonInfo != null) {
                      widget.updatePersonInfo(_person);
                    }
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, kSmallMargin, kSmallMargin, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSmallMargin),
                        color: Colors.white60,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white30,
                          )
                        ]),
                    child: Image(
                      image: AssetImage(Astrology.instance
                          .getAssetImagePath(_person.birthYear)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ScrollingNumericTicker(
            config: ScrollingTickerConfig(
              minValue: 1920,
              maxValue: 2020,
              pointerPositionStart: 6,
              height: 50.0,
            ),
            initialValue: _person.birthYear,
            onChanged: (int value) {
              setState(() {
                _person.birthYear = value;
              });
            },
          )
        ],
      ),
    );
  }
}
