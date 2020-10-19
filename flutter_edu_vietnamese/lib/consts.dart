import 'package:flutter/material.dart';

const Color kHDIPrimaryColor = Color(0xffBE021A);
const Color kHDIBGColor = Color(0xff53000B);
const double kHDIStandardMargin = 20.0;
const double kHDISmallMargin = 10.0;
const double kHDISmallBorder = 4.0;
const double kHDISmallFontSize = 10;
const double kHDIDetailFontSize = 14;
const double kHDIKeyPointFontSize = 60;
const double kHDITitleFontSize = 40;
const double kHDISubtitleFontSize = 20;
const double kHDIYouTubeWidth = 128;
const double kHDIYouTubeHeight = 72;
const Color kHDISubtleColor = Color(0xFF90A4AE);

enum Gender { MALE, FEMALE }

class Routes {
  static const String HOME = '/';
  static const String E1_IMAGE = '/e1';
  static const String E2_BIZ_CARD = '/e2';
  static const String E3_RANDOM_BANK_NOTE = '/e3';
  static const String E4_SOUNDPAD = '/e4';
  static const String E5_QUIZ = '/e5';
  static const String E6_COUPLE_MATCH = '/e6';
  static const String E7_API_WORK = '/e7';
}
