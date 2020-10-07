import 'dart:math';

import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/BirthYearInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';
import 'RoundedIconButton.dart';

class BirthYearSelectionWidget extends StatefulWidget {
  Gender gender;
  double birthYear;

  BirthYearSelectionWidget({@required this.gender, @required this.birthYear});

  @override
  _BirthYearSelectionWidgetState createState() =>
      _BirthYearSelectionWidgetState();
}

class _BirthYearSelectionWidgetState extends State<BirthYearSelectionWidget> {
  BirthYearInfo birthInfoWidget;
  @override
  Widget build(BuildContext context) {
    birthInfoWidget = BirthYearInfo(
      birthYear: widget.birthYear.round(),
      gender: widget.gender,
      alignment: CrossAxisAlignment.center,
      enableButtons: true,
      onGenderSelected: (){
        widget.gender = birthInfoWidget.gender;
      },
    );
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
                  child: birthInfoWidget,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(
                          0, kStandardMargin, kSmallMargin, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSmallMargin),
                          color: Colors.white60,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white30,
                              )
                          ]),
                      child: Image(
                        image: AssetImage(Astrology.instance.getAssetImagePath(
                            widget.birthYear.round())),
                      ),
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
                    value: widget.birthYear,
                    label: '${widget.birthYear.round()}',
                    divisions: 100,
                    onChanged: (value) {
                      setState(() {
                        widget.birthYear = value;
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
