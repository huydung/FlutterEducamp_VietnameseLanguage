//https://liu.com.vn/bai-viet/xem-bang-tra-cung-menh-vo-chong-co-hop-nhau-hay-khong

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology

import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:flutter/material.dart';

import 'components/BirthYearSelectionWidget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Couple Matching Score'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: kSmallMargin,
          ),
          Expanded(
            //first card
            flex: 3,
            child: BirthYearSelectionWidget(
              gender: Gender.MALE,
            ),
          ),
          SizedBox(
            height: kSmallMargin,
          ),
          Expanded(
            flex: 3,
            child: BirthYearSelectionWidget(
              gender: Gender.FEMALE,
            ),
          ),
          SizedBox(
            height: kStandardMargin,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: kKeyPointFontSize * 0.7),
                  ),
                ),
                padding: EdgeInsets.only(bottom: kStandardMargin),
                color: kHDIPrimaryColor,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
