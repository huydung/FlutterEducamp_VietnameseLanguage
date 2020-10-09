//https://liu.com.vn/bai-viet/xem-bang-tra-cung-menh-vo-chong-co-hop-nhau-hay-khong

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology

import 'dart:math';

import 'package:Vietnamese_and_Flutter_Educamp/pages/e6_CoupleMatchResult.dart';
import 'package:flutter/material.dart';

import '../components/BigButton.dart';
import '../components/BirthYearSelectionWidget.dart';
import '../consts.dart';

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
    BirthYearSelectionWidget p1BirthYearSelectionWidget =
        BirthYearSelectionWidget(
      gender: Gender.MALE,
      birthYear: DateTime.now().year.toDouble() - 45 + (Random().nextInt(30)),
    );
    BirthYearSelectionWidget p2BirthYearSelectionWidget =
        BirthYearSelectionWidget(
      gender: Gender.FEMALE,
      birthYear: DateTime.now().year.toDouble() - 45 + (Random().nextInt(30)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Couple Matching Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    p1BirthYearSelectionWidget,
                    p2BirthYearSelectionWidget,
                  ],
                ),
              ),
            ),
            BigButton(
              text: 'CALCULATE',
              onTap: () {
                print(
                    'p1BirthYearSelectionWidget.gender = ${p1BirthYearSelectionWidget.gender}');
                print(
                    'p2BirthYearSelectionWidget.gender = ${p2BirthYearSelectionWidget.gender}');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => E6_CoupleMatchResult(
                              p1BirthYear:
                                  p1BirthYearSelectionWidget.birthYear.round(),
                              p1Gender: p1BirthYearSelectionWidget.gender,
                              p2BirthYear:
                                  p2BirthYearSelectionWidget.birthYear.round(),
                              p2Gender: p2BirthYearSelectionWidget.gender,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
