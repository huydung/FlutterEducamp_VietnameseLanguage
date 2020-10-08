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
  BirthYearInfo birthInfoWidget;

  @override
  Widget build(BuildContext context) {
    birthInfoWidget = BirthYearInfo(
      birthYear: widget.birthYear.round(),
      gender: widget.gender,
      alignment: CrossAxisAlignment.center,
      enableButtons: true,
      onGenderSelected: () {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: birthInfoWidget,
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
                minValue: 1970,
                maxValue: 2020,
                numStepsInFullView: 30,
                pointerColor: Colors.white,
                pointerPositionIndex: 5,
                majorStep: 10,
                minorStep: 1,
                height: 60,
                tickerStepWidth: 12.0),
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
