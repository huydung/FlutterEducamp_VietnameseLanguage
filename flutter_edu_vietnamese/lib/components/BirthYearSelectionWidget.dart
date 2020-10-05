import 'dart:math';

import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';

class BirthYearSelectionWidget extends StatefulWidget {
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
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Row(
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
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 1.0,
                              fillColor: Colors.blueGrey[800],
                              child: FaIcon(
                                FontAwesomeIcons.venus,
                                size: kStandardMargin * 1.5,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                          SizedBox(
                            width: kSmallMargin,
                          ),
                          SizedBox(
                            width: kStandardMargin * 2.5,
                            height: kStandardMargin * 2.5,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 1.0,
                              fillColor: Colors.blueGrey[800],
                              child: FaIcon(
                                FontAwesomeIcons.mars,
                                size: kStandardMargin * 1.5,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_birthYear.round()}',
                        style: TextStyle(fontSize: kKeyPointFontSize),
                      ),
                      Text(
                        AstrologyBrain.getInstance()
                            .getYearName(_birthYear.round()),
                        style: TextStyle(fontSize: kSubtitleFontSize),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0, kStandardMargin, kSmallMargin, 0),
                    child: Container(
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
                        image: AssetImage(AstrologyBrain.getInstance()
                            .getAssetImagePath(_birthYear.round())),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
                    'Select year of birth (lunar year)',
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
