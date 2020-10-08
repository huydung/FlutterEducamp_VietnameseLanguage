import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../consts.dart';

class ScrollingTickerConfig {
  int minValue;
  int maxValue;
  int numStepsInFullView;
  int pointerPositionIndex;
  int majorStep = 10;
  int minorStep = 1;
  double tickerStepWidth;
  double height;
  Color pointerColor;

  ScrollingTickerConfig({
    @required this.minValue,
    @required this.maxValue,
    @required this.numStepsInFullView,
    @required this.pointerPositionIndex,
    @required this.majorStep,
    @required this.minorStep,
    @required this.tickerStepWidth,
    @required this.height,
    @required this.pointerColor,
  });
}

class ScrollingNumericTicker extends StatefulWidget {
  final ScrollingTickerConfig config;
  final Function(int) onChanged;
  int selectedValue;

  ScrollingNumericTicker(
      {@required this.config,
      @required this.onChanged,
      @required this.selectedValue});

  @override
  _ScrollingNumericTickerState createState() => _ScrollingNumericTickerState();
}

class _ScrollingNumericTickerState extends State<ScrollingNumericTicker> {
  ScrollController _controller;

  @override
  void initState() {
    print('initState in scrolling ticker widget');
    _controller = ScrollController(
        initialScrollOffset: (widget.selectedValue - widget.config.minValue) *
            widget.config.tickerStepWidth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollingTickerConfig config = widget.config;

    SingleChildScrollView scrollView = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _controller,
      child: CustomPaint(
        size: Size(
            (config.maxValue - config.minValue + config.numStepsInFullView) *
                config.tickerStepWidth,
            config.height),
        //child: Text('Select Lunar Birth Year'),
        painter: LongNumericDialPainter(config),
      ),
    );

    return Container(
      width: config.numStepsInFullView * config.tickerStepWidth,
      height: 60,
      margin: EdgeInsets.fromLTRB(0, kSmallMargin, 0, 0),
      child: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            child: scrollView,
            onNotification: (scrollNoti) {
              //print('ScrollNotification detected!');
              if (scrollNoti is ScrollUpdateNotification) {
                print(
                    'Currently at ${scrollNoti.metrics.pixels} in between ${scrollNoti.metrics.minScrollExtent} and ${scrollNoti.metrics.maxScrollExtent}');
                int currentValue = config.minValue +
                    (scrollNoti.metrics.pixels / config.tickerStepWidth)
                        .round();
                widget.selectedValue = currentValue;
                setState(() {
                  if (widget.onChanged != null) {
                    widget.onChanged(currentValue);
                  }
                });
              }
              return true;
            },
          ),
          Padding(
            child: Icon(
              Icons.arrow_downward,
              size: config.tickerStepWidth * 2,
              color: config.pointerColor,
            ),
            padding: EdgeInsets.only(
                left: config.pointerPositionIndex * config.tickerStepWidth),
          ),
        ],
      ),
    );
  }
}

class LongNumericDialPainter extends CustomPainter {
  ScrollingTickerConfig config;

  final double _kMajorTickerHeight = 40.0;
  final double _kMinorTickerHeight = 6.0;
  final double _kTopMarginDial = 15.0;

  LongNumericDialPainter(this.config);

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
        (bounds.height - _kMajorTickerHeight) * 0.5 + _kTopMarginDial;
    double bottomDyMajor = topDyMajor + _kMajorTickerHeight + _kTopMarginDial;

    //vertical positions for minor ticks
    double topDyMinor =
        (bounds.height - _kMinorTickerHeight) * 0.5 + _kTopMarginDial;
    double bottomDyMinor = topDyMinor + _kMinorTickerHeight + _kTopMarginDial;

    int numSteps =
        config.maxValue - config.minValue + config.numStepsInFullView;

    for (int i = 0; i < numSteps; i++) {
      int num = config.minValue + i - config.pointerPositionIndex;
      if (num < config.minValue || num > config.maxValue) {
        continue;
      }
      if (num % config.majorStep == 0) {
        canvas.drawLine(
            Offset((i + 1) * config.tickerStepWidth, topDyMajor),
            Offset((i + 1) * config.tickerStepWidth, bottomDyMajor),
            paintWhite);

        //int tenLevelNumber = (num / 10).floor() % 10;
        //int lastTwoNum = num % 100;
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: '${num}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0);
        textPainter.paint(canvas,
            Offset((i + 1) * config.tickerStepWidth + 3.0, topDyMajor - 2));
      } else {
        canvas.drawLine(Offset((i + 1) * config.tickerStepWidth, topDyMinor),
            Offset((i + 1) * config.tickerStepWidth, bottomDyMinor), paintGrey);
      }
    }
  }

  @override
  bool shouldRepaint(LongNumericDialPainter oldDelegate) {
    return oldDelegate.config != config;
  }
}