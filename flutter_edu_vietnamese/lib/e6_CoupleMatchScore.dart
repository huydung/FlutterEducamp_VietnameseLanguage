//https://liu.com.vn/bai-viet/xem-bang-tra-cung-menh-vo-chong-co-hop-nhau-hay-khong

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology

import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class E6_CoupleMatch extends StatefulWidget {
  E6_CoupleMatch({Key key, this.title}) : super(key: key);
  final String title;

  @override
  E6_CoupleMatchState createState() => E6_CoupleMatchState();
}

class E6_CoupleMatchState extends State<E6_CoupleMatch> {
  @override
  void initState() {
    super.initState();
  }

  double _birthYear = DateTime.now().year.toDouble() - 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Couple Matching Score'),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            //first card
            flex: 1,
            child: Card(
              color: kHDIBGColor,
              elevation: kSmallMargin,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kStandardMargin),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                0, kStandardMargin, kSmallMargin, 0),
                            child: Image(
                              image: AssetImage('assets/zodiacs/cat'
                                  '.png'),
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
                            activeTrackColor: Colors.blueGrey[300],
                            inactiveTrackColor: Colors.blueGrey[300],
                            thumbColor: kHDIPrimaryColor,
                            valueIndicatorColor: Colors.blueGrey[300],
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.grey[900],
                            ),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                              elevation: 5,
                            ),
                            //thumbShape: PaddleSliderValueIndicatorShape(),
                            //showValueIndicator: ShowValueIndicator.always,
                          ),
                          child: Slider(
                            min: DateTime.now().year.toDouble() - 90,
                            max: DateTime.now().year.toDouble() - 13,
                            value: _birthYear,
                            label: '${_birthYear.round()}',
                            divisions: (90 - 13),
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
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      )),
    );
  }
}
