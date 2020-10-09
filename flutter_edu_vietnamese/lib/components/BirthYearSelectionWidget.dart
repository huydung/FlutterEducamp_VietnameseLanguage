import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/BirthYearInfo.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/ScrollingNumericPicker.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class BirthYearSelectionWidget extends StatefulWidget {
  Gender gender;
  double birthYear;

  BirthYearSelectionWidget({@required this.gender, @required this.birthYear});

  @override
  _BirthYearSelectionWidgetState createState() =>
      _BirthYearSelectionWidgetState();
}

class _BirthYearSelectionWidgetState extends State<BirthYearSelectionWidget> {
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
                child: BirthYearInfo(
                  birthYear: widget.birthYear.round(),
                  gender: widget.gender,
                  alignment: CrossAxisAlignment.start,
                  enableButtons: true,
                  onGenderSelected: (gender) {
                    widget.gender = gender;
                  },
                ),
              ),
              Expanded(
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
                          .getAssetImagePath(widget.birthYear.round())),
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
            selectedValue: widget.birthYear.round(),
            onChanged: (int value) {
              setState(() {
                widget.birthYear = value.toDouble();
              });
            },
          )
        ],
      ),
    );
  }
}
