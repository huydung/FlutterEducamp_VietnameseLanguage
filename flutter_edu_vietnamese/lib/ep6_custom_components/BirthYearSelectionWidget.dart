import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:flutter/material.dart';

import 'BirthYearInfo.dart';
import 'CoupleMatchModel.dart';
import 'ScrollingNumericPicker.dart';
import 'astrologyBrain.dart';

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
      padding: EdgeInsets.all(kHDISmallMargin),
      margin: EdgeInsets.fromLTRB(
          kHDISmallMargin, kHDISmallMargin, kHDISmallMargin, 0),
      decoration: BoxDecoration(
        color: kHDIBGColor,
        borderRadius: BorderRadius.circular(kHDISmallMargin),
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
                        0, kHDISmallMargin, kHDISmallMargin, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kHDISmallMargin),
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
