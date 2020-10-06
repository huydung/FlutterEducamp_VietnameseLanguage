import 'dart:math';

import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import 'RoundedIconButton.dart';

class BirthYearSelectionWidget extends StatefulWidget {
  Gender gender;

  BirthYearSelectionWidget({@required this.gender});

  @override
  _BirthYearSelectionWidgetState createState() =>
      _BirthYearSelectionWidgetState();
}

class _BirthYearSelectionWidgetState extends State<BirthYearSelectionWidget> {
  double _birthYear =
      DateTime.now().year.toDouble() - 45 + (Random().nextInt(30));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSmallMargin),
      margin: EdgeInsets.all(kSmallMargin),
      decoration: BoxDecoration(
        color: kHDIBGColor,
        borderRadius: BorderRadius.circular(kSmallMargin),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: kStandardMargin * 2.5,
                            height: kStandardMargin * 2.5,
                            child: RoundedIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    widget.gender = Gender.FEMALE;
                                  },
                                );
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
                                setState(
                                  () {
                                    widget.gender = Gender.MALE;
                                  },
                                );
                              },
                              icon: FontAwesomeIcons.mars,
                              selected: widget.gender == Gender.MALE,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_birthYear.round()}',
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
                      Text(
                        Astrology.getInstance().getYearDescription(
                            _birthYear.round(), widget.gender),
                        style: TextStyle(fontSize: kDetailFontSize),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, kStandardMargin, kSmallMargin, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSmallMargin),
                        color: Colors.white60,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white30,
                            //blurRadius: kSmallMargin * 0.3,
                            //offset: Offset.fromDirection(225, 5),
                            // spreadRadius: kSmallMargin * 0.5,
                          )
                        ]),
                    child: Image(
                      image: AssetImage(Astrology.getInstance()
                          .getAssetImagePath(_birthYear.round())),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    //trackShape: CustomTrackShape(),
                    activeTrackColor: Colors.blueGrey[300],
                    inactiveTrackColor: Colors.blueGrey[300],
                    thumbColor: kHDIPrimaryColor,
                    // valueIndicatorColor: Colors.blueGrey[300],
                    // valueIndicatorTextStyle: TextStyle(
                    //   color: Colors.grey[900],
                    // ),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                      elevation: 5,
                    ),
                    //thumbShape: PaddleSliderValueIndicatorShape(),
                    //showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    min: DateTime.now().year.toDouble() - 100,
                    max: DateTime.now().year.toDouble(),
                    value: _birthYear,
                    label: '${_birthYear.round()}',
                    divisions: 100,
                    onChanged: (value) {
                      setState(() {
                        _birthYear = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kStandardMargin, vertical: 0),
                  child: Text(
                    '^ Select year of birth (lunar year)',
                    style: TextStyle(color: Colors.blueGrey[300]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(
        trackLeft + 15, trackTop, trackWidth - 30, trackHeight);
  }
}
