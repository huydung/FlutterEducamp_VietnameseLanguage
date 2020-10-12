//https://liu.com.vn/bai-viet/xem-bang-tra-cung-menh-vo-chong-co-hop-nhau-hay-khong

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology

import 'package:Vietnamese_and_Flutter_Educamp/brains/astrologyBrain.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/BigButton.dart';
import 'package:Vietnamese_and_Flutter_Educamp/components/BirthYearInfo.dart';
import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:flutter/material.dart';

class E6_CoupleMatchResult extends StatelessWidget {
  final int p1BirthYear;
  final int p2BirthYear;
  final Gender p1Gender;
  final Gender p2Gender;

  E6_CoupleMatchResult(
      {this.p1BirthYear, this.p2BirthYear, this.p1Gender, this.p2Gender});

  @override
  Widget build(BuildContext context) {
    AstrologyResult zodiacResult =
        Astrology.instance.getZodiacResult(p1BirthYear, p2BirthYear);
    AstrologyResult cungMenhResult = Astrology.instance
        .getCungMenhResult(p1BirthYear, p1Gender, p2BirthYear, p2Gender);

    int zodiacScore = zodiacResult.score;
    int cungmenhScore = cungMenhResult.score;
    int totalScore = zodiacScore + cungmenhScore;

    String overallResult;

    if (totalScore > 0) {
      overallResult =
          'Total Score: ${totalScore}.\n\nCongratulations, the stars '
          'are shining '
          'bright for '
          'you two, be happy!';
    } else if (totalScore == 0) {
      overallResult =
          'Total Score: ${totalScore}.\n\nAll signs included, nothing '
          'terrible \nshould happen, be happy!';
    } else {
      overallResult =
          'Total Score: ${totalScore}.\n\nThe astrology says you two are NOT\n '
          'meant for each other. \nBut who cares? Be happy!';
    }

    Icon zodiacIcon;
    Icon cungmenhIcon;
    double iconSize = 40;

    if (zodiacScore > 0) {
      zodiacIcon = Icon(
        Icons.check_circle,
        color: Colors.green,
        size: iconSize,
      );
    } else if (zodiacScore < 0) {
      zodiacIcon = Icon(
        Icons.warning,
        color: Colors.yellow,
        size: iconSize,
      );
    } else {
      zodiacIcon = Icon(
        Icons.remove_circle,
        color: Colors.blue[500],
        size: iconSize,
      );
    }
    ;

    if (cungmenhScore > 0) {
      cungmenhIcon = Icon(
        Icons.check_circle,
        color: Colors.green,
        size: iconSize,
      );
    } else {
      cungmenhIcon = Icon(
        Icons.warning,
        color: Colors.yellow,
        size: iconSize,
      );
    }
    ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Couple Matching Score'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            //first card
            flex: 5,
            child: Container(
                padding: EdgeInsets.all(kSmallMargin),
                margin: EdgeInsets.all(kSmallMargin),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSmallMargin),
                  color: kHDIBGColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BirthYearInfo(
                          birthYear: p1BirthYear,
                          gender: p1Gender,
                          alignment: CrossAxisAlignment.start,
                          enableButtons: false,
                        ),
                        BirthYearInfo(
                          birthYear: p2BirthYear,
                          gender: p2Gender,
                          alignment: CrossAxisAlignment.end,
                          enableButtons: false,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey[300],
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: zodiacIcon,
                        title: Text(zodiacResult.title),
                        subtitle: Text(zodiacResult.detail),
                        isThreeLine: false,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      alignment: Alignment.center,
                      child: ListTile(
                          leading: cungmenhIcon,
                          title: Text(cungMenhResult.title),
                          subtitle: Text(cungMenhResult.detail),
                          isThreeLine: true),
                    ),
                    Divider(
                      color: Colors.blueGrey[300],
                    ),
                    Center(
                      widthFactor: 0.8,
                      child: Text(
                        overallResult,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: kSubtitleFontSize,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          BigButton(
            text: 'TRY AGAIN',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
