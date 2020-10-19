import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:Vietnamese_and_Flutter_Educamp/models/CoupleMatchModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import 'RoundedIconButton.dart';

class BirthYearInfo extends StatefulWidget {
  final Person initialPerson;
  final CrossAxisAlignment alignment;
  final bool buttonsEnabled;

  final Function(Gender) onGenderSelected;

  BirthYearInfo(
      {@required this.initialPerson,
      @required this.alignment,
      @required this.buttonsEnabled,
      this.onGenderSelected});

  @override
  _BirthYearInfoState createState() => _BirthYearInfoState(initialPerson);
}

class _BirthYearInfoState extends State<BirthYearInfo> {
  Person _person;

  _BirthYearInfoState(this._person);

  void _selectGender(Gender gender) {
    if (widget.buttonsEnabled) {
      setState(
        () {
          _person.gender = gender;
          if (widget.onGenderSelected != null) {
            widget.onGenderSelected(gender);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: widget.alignment,
      children: [
        Row(
          mainAxisAlignment: widget.alignment == CrossAxisAlignment.start
              ? MainAxisAlignment.start
              : (widget.alignment == CrossAxisAlignment.end
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center),
          children: [
            SizedBox(
              width: kHDIStandardMargin * 2.5,
              height: kHDIStandardMargin * 2.5,
              child: RoundedIconButton(
                onPressed: () {
                  _selectGender(Gender.FEMALE);
                },
                icon: FontAwesomeIcons.venus,
                selected: _person.gender == Gender.FEMALE,
              ),
            ),
            SizedBox(
              width: kHDISmallMargin,
            ),
            SizedBox(
              width: kHDIStandardMargin * 2.5,
              height: kHDIStandardMargin * 2.5,
              child: RoundedIconButton(
                onPressed: () {
                  _selectGender(Gender.MALE);
                },
                icon: FontAwesomeIcons.mars,
                selected: _person.gender == Gender.MALE,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kHDISmallMargin,
        ),
        Text(
          Astrology.instance
              .getYearDescription(_person.birthYear, _person.gender),
          style: TextStyle(fontSize: kHDIDetailFontSize),
        ),
        Text(
          '${_person.birthYear}',
          style: TextStyle(
              fontSize: kHDITitleFontSize,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: kHDIPrimaryColor,
                )
              ]),
        ),
      ],
    );
  }
}
