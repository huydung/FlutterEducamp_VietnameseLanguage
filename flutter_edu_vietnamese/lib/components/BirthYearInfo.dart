import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import 'RoundedIconButton.dart';

class BirthYearInfo extends StatefulWidget {
  int birthYear;
  Gender gender;
  CrossAxisAlignment alignment;
  bool enableButtons;

  final Function(Gender) onGenderSelected;

  BirthYearInfo(
      {@required this.birthYear,
      @required this.gender,
      @required this.alignment,
      @required this.enableButtons,
      this.onGenderSelected});

  @override
  _BirthYearInfoState createState() => _BirthYearInfoState();
}

class _BirthYearInfoState extends State<BirthYearInfo> {
  void _selectGender(Gender gender) {
    if (widget.enableButtons) {
      setState(
        () {
          widget.gender = gender;
          if (widget.onGenderSelected != null) {
            widget.onGenderSelected(gender);
          }
        },
      );
    }
    ;
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
              width: kStandardMargin * 2.5,
              height: kStandardMargin * 2.5,
              child: RoundedIconButton(
                onPressed: () {
                  _selectGender(Gender.FEMALE);
                },
                icon: FontAwesomeIcons.venus,
                selected: widget.gender == Gender.FEMALE,
              ),
            ),
            SizedBox(
              width: kSmallMargin,
            ),
            SizedBox(
              width: kStandardMargin * 2.5,
              height: kStandardMargin * 2.5,
              child: RoundedIconButton(
                onPressed: () {
                  _selectGender(Gender.MALE);
                },
                icon: FontAwesomeIcons.mars,
                selected: widget.gender == Gender.MALE,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kSmallMargin,
        ),
        Text(
          Astrology.instance
              .getYearDescription(widget.birthYear, widget.gender),
          style: TextStyle(fontSize: kDetailFontSize),
        ),
        Text(
          '${widget.birthYear}',
          style: TextStyle(
              fontSize: kKeyPointFontSize,
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
