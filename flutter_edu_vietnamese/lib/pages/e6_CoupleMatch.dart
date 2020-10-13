//https://liu.com.vn/bai-viet/xem-bang-tra-cung-menh-vo-chong-co-hop-nhau-hay-khong

import 'package:Vietnamese_and_Flutter_Educamp/models/CoupleMatchModel.dart';
import 'package:flutter/material.dart';

import '../components/BigButton.dart';
import '../components/BirthYearSelectionWidget.dart';
import 'e6_CoupleMatchResult.dart';

class PageCoupleInput extends StatefulWidget {
  @override
  PageCoupleInputState createState() => PageCoupleInputState();
}

class PageCoupleInputState extends State<PageCoupleInput> {
  CoupleMatchViewModel _model = new CoupleMatchViewModel();

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
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BirthYearSelectionWidget(
                      forPerson: _model.p1,
                      updatePersonInfo: (Person p) {
                        _model.setGenderP1(p.gender);
                        _model.setBirthYearP1(p.birthYear);
                      },
                    ),
                    BirthYearSelectionWidget(
                      forPerson: _model.p2,
                      updatePersonInfo: (Person p) {
                        _model.setGenderP2(p.gender);
                        _model.setBirthYearP2(p.birthYear);
                      },
                    ),
                  ],
                ),
              ),
            ),
            BigButton(
              text: 'CALCULATE',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PageCoupleResult(_model.p1, _model.p2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
