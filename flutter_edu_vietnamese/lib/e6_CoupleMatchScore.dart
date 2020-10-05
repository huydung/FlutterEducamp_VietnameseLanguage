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
            height: kStandardMargin * 2,
          ),
          Expanded(
            //first card
            flex: 1,
            child: BirthYearSelectionWidget(),
          ),
          SizedBox(
            height: kStandardMargin,
          ),
          Expanded(
            child: BirthYearSelectionWidget(),
          ),
          SizedBox(
            height: kStandardMargin * 2,
          ),
        ],
      )),
    );
  }
}
