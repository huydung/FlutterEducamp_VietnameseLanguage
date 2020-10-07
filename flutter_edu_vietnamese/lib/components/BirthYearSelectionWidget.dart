import 'dart:math' as math;
import 'dart:ui' as ui;
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
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

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
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.fromLTRB(0, kSmallMargin, 0, 0),
            child: Stack(
              children: [
                NotificationListener <ScrollNotification>(

                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    child: CustomPaint(
                      size: Size((2040 - 1940 + 1) * kTickerStep, 60),
                      //child: Text('Select Lunar Birth Year'),
                      painter: LongNumericDialPainter(
                          minValue: 1940,
                          maxValue: 2040,
                          majorStep: 10,
                          minorStep: 1),
                    ),
                  ),
                  onNotification: (scrollNoti) {
                    //print('ScrollNotification detected!');
                    if( scrollNoti is ScrollUpdateNotification ){
                      print('Currently at ${scrollNoti.metrics.pixels} in between ${scrollNoti.metrics.minScrollExtent} and ${scrollNoti.metrics.maxScrollExtent}');
                      int currentValue = 1940 + (scrollNoti.metrics.pixels / kTickerStep).round();
                      setState(() {
                        widget.birthYear = currentValue.toDouble();
                      });
                    };
                    return true;
                  },
                ),
                Padding(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: kTickerStep * 2,
                    color: kHDIPrimaryColor,
                  ),
                  padding: EdgeInsets.only(left: 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const double kTickerStep = 16.0;
const double kMajorTickerHeight = 40.0;
const double kMinorTickerHeight = 6.0;
const double kTopMarginDial = 15.0;

class LongNumericDialPainter extends CustomPainter {
  final int minValue;
  final int maxValue;
  final int majorStep;
  final int minorStep;

  LongNumericDialPainter(
      {@required this.minValue,
      @required this.maxValue,
      @required this.majorStep,
      @required this.minorStep});

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    _drawBackground(canvas, shapeBounds);
    _drawTickers(canvas, shapeBounds);
  }

  void _drawBackground(Canvas canvas, Rect bounds) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        bounds.topCenter,
        bounds.bottomCenter,
        [
          Color(0xFF222222),
          Color(0xFF111111),
          Colors.black,
          Color(0xFF111111),
          Color(0xFF222222)
        ],
        [0.05, 0.3, 0.5, 0.7, 0.95],
      );
    canvas.drawRect(bounds, paint);
  }

  void _drawTickers(Canvas canvas, Rect bounds) {
    final paintWhite = Paint()..color = Colors.white;
    final paintGrey = Paint()..color = Color(0xFF696969);

    //vertical positions for major ticks
    double topDyMajor =
        (bounds.height - kMajorTickerHeight) * 0.5 + kTopMarginDial;
    double bottomDyMajor = topDyMajor + kMajorTickerHeight + kTopMarginDial;

    //vertical positions for minor ticks
    double topDyMinor =
        (bounds.height - kMinorTickerHeight) * 0.5 + kTopMarginDial;
    double bottomDyMinor = topDyMinor + kMinorTickerHeight + kTopMarginDial;

    int numSteps = maxValue - minValue;
    int j = 0;
    for (int i = 1; i < numSteps + 1; i++) {
      if (j % majorStep == 0) {
        canvas.drawLine(Offset(i * kTickerStep, topDyMajor),
            Offset(i * kTickerStep, bottomDyMajor), paintWhite);
        int num = minValue + j;
        int tenLevelNumber = (num / 10).floor() % 10;

        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: '${tenLevelNumber}x',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0);
        textPainter.paint(
            canvas, Offset(i * kTickerStep + 3.0, topDyMajor - 2));
      } else {
        canvas.drawLine(Offset(i * kTickerStep, topDyMinor),
            Offset(i * kTickerStep, bottomDyMinor), paintGrey);
      }
      j++;
    }
  }

  @override
  bool shouldRepaint(LongNumericDialPainter oldDelegate) {
    return (oldDelegate.minValue != minValue ||
        oldDelegate.maxValue != maxValue);
  }
}
