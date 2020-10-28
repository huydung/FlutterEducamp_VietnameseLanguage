import 'dart:math';

import 'package:flutter/material.dart';

import '../consts.dart';

//https://www.itourvn.com/blog/the-meanings-behind-vietnamese-banknotes

class BankNoteInfo {
  String assetPath;
  String explanation;
  String bigName;

  BankNoteInfo({this.assetPath, this.explanation, this.bigName});
}

class PageRandom extends StatefulWidget {
  @override
  PageRandomState createState() => PageRandomState();
}

class PageRandomState extends State<PageRandom> {
  int index = 0;
  bool _showNote = true;

  List<BankNoteInfo> bankNotes = [
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-1000.jpg',
        bigName: 'MỘT',
        explanation: 'Image of locals using elephants for logging in Tay '
            'Nguyen Province.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-2000.jpg',
        bigName: 'HAI',
        explanation: 'Female textile factory workers in  '
            ' the largest textile factory of Indochina'
            ' during the French colonization period at Nam Dinh Province, '
            'Northern Vietnam.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-5000.jpg',
        bigName: 'NĂM',
        explanation: 'Image of Tri An Hydroelectric Power Plant which '
            'located in Dong Nai Province Province - A recognition of the '
            'Soviet Union\'s support to build this plant.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-10000.jpg',
        bigName: 'MƯỜI',
        explanation: 'Printed on the VND 10,000 banknote is the White Tiger'
            ' Oil Field, which is a major oil field and has been in '
            'operation since 1975.'
            '.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-20000.jpg',
        bigName: 'HAI MƯƠI',
        explanation:
            'Commonly known as the Japanese Covered Bridge, this 18th-century landmark can be found in Hoi An, an ancient town in the Central of Vietnam.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-50000.jpg',
        bigName: 'NĂM MƯƠI',
        explanation: 'Two historic sites in Hue: '
            'Nghenh Luong Dinh - the resting'
            ' place of the Nguyen King before the dragon boat cruising on '
            'the Perfume River, and Phu Van Lau where '
            '- in the past - the locals could read announcements from the '
            'government.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-100000.jpg',
        bigName: 'MỘT TRĂM',
        explanation: 'Van Mieu - Quoc Tu Giam, or the Temple of Literature,'
            ' is considered as the'
            ' first university of Vietnam. It is one of the iconic sites of'
            ' Hanoi, the capital of Vietnam.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-200000.jpg',
        bigName: 'HAI TRĂM',
        explanation:
            'Dinh Huong Island at the UNESCO Heritage site of Halong Bay.'),
    BankNoteInfo(
        assetPath: 'assets/ep3_random/bank-notes-500000.jpg',
        bigName: 'NĂM TRĂM',
        explanation:
            'The highest Vietnamese banknote denomination is the birthplace of Ho Chi Minh, the 5-room house at Lotus Village, Nam Dan District, Nghe An Province.'),
  ];

  void changeBankNote() {
    setState(() {
      index = Random().nextInt(bankNotes.length);
    });
  }

  void swipeBankNote(bool foward) {
    setState(() {
      if (foward) {
        index = index < bankNotes.length - 1 ? index + 1 : 0;
      } else {
        index = index > 0 ? index - 1 : bankNotes.length - 1;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3. Vietnamese Bank Notes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: ListView(
                padding: EdgeInsets.only(top: kHDISmallMargin),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: kHDIStandardMargin),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          this._showNote = !this._showNote;
                        });
                      },
                      child: Image(
                        image: AssetImage(bankNotes[index].assetPath),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          bankNotes[index].bigName,
                          style: TextStyle(
                              fontSize: kHDIKeyPointFontSize,
                              fontFamily: 'Fira Sans '
                                  'Extra Condensed'),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'nghìn\nđồng',
                          style: TextStyle(
                              fontSize: kHDISubtitleFontSize,
                              color: kHDISubtleColor,
                              fontFamily: 'Fira Sans '
                                  'Extra Condensed'),
                          textAlign: TextAlign.left,
                        ),
                      ]),
                  Visibility(
                    visible: _showNote,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(kHDIStandardMargin,
                          kHDISmallMargin, kHDIStandardMargin, kHDISmallMargin),
                      child: Text(
                        bankNotes[index].explanation,
                        style: TextStyle(
                          fontSize: kHDIDetailFontSize,
                          color: kHDISubtleColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: kHDISubtleColor,
              indent: kHDIStandardMargin,
              endIndent: kHDIStandardMargin,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          swipeBankNote(false);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: IconButton(
                        onPressed: () {
                          changeBankNote();
                        },
                        icon: Icon(
                          Icons.shuffle,
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          swipeBankNote(true);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
