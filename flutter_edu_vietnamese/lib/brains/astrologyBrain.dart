import 'dart:core';

import '../consts.dart';

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology
//https://tuvikhoahoc.vn/xem-tuoi-vo-chong/chong-dinh-mao-va-vo-dinh-mao-hop
// -nhau-khong.html
//I know that the year 0004 is the year of rat. And no one should be alive if
// they were born before the year of 4
const int RAT_YEAR = 4;

class Astrology {
  static Astrology _instance;

  Astrology._();

  static Astrology getInstance() {
    _instance = _instance ?? Astrology._();
    return _instance;
  }

  String getYearName(int year) {
    return _cans[year % 10].name +
        ' ' +
        _zodiacs[(year - RAT_YEAR) % 12].name; // + ' - ' + yearZodiac.title;
  }

  String getYearDescription(int year, Gender gender) {
    return getYearName(year) + ', Cung ' + getCungMenh(year, gender);
  }

  String getAssetImagePath(int year) {
    return _zodiacs[(year - RAT_YEAR) % 12].assetIcon;
  }

  String getCungMenh(int year, Gender gender) {
    //https://tuvingaynay.com/bang-tra-cung-menh-vo-chong-de-xem-co-hop-tuoi-nhau-hay-khong.html
    //Tinh tong cac chu so trong nam
    int numSum = 0;
    int yearRemain = year;
    while (yearRemain > 0) {
      numSum = numSum + yearRemain % 10;
      yearRemain = (yearRemain / 10).floor();
    }
    ;

    if (gender == Gender.MALE) {
      // print('Year $year, numsum = $numSum, gender ${gender.toString()}, cung: '
      //     '${_maleCungMenh[numSum % 9].name}');
      return _maleCungMenh[numSum % 9].name;
    } else {
      // print('Year $year, numsum = $numSum, gender ${gender.toString()}, cung: '
      //     '${_femaleCungMenh[numSum % 9].name}');
      return _femaleCungMenh[numSum % 9].name;
    }
  }

  static final Zodiac rat = Zodiac(0, 'Tí', 'rat.png', 'The Smart',
      'The rat is very sociable and dynamic. People of the Rat year has a great self-confidence on the appearance.');
  static final Zodiac buffalo = Zodiac(
      1,
      'Sửu',
      'buffalo.png',
      'The Born Leader',
      'The buffalo represent diligence and patience. People of the buffalo year usually have a slow but steady progression. Also, they are imperturbable and steadfast but stubborn.');
  static final Zodiac tiger = Zodiac(
      2,
      'Dần',
      'tiger.png',
      'The Powerful',
      'Very sensitive, yet the tiger often worries and gets angry quickly. '
          'However, people of the tiger year are very indecisive when there are decisions need to be made. Despite being hot-tempered, they can adapt well to any circumstances.');
  static final Zodiac cat = Zodiac(3, 'Mão', 'cat.png', 'The Flexible',
      'People of the cat year achieve a lot of success in the work while remaining very modest and patient. They are soft-spoken, ambitious yet talented.');
  static final Zodiac dragon = Zodiac(4, 'Thìn', 'dragon.png', 'The Holy',
      'The dragon symbolizes royal authority, power and prosperity. People of this age are very active and have great facilities to become rich.');
  static final Zodiac snake = Zodiac(5, 'Tị', 'snake.png', 'The Lucky',
      'Very wise and courageous, people of this age can easily succeed in the work. They are also sympathetic, determined yet intolerant.');
  static final Zodiac horse = Zodiac(6, 'Ngọ', 'horse.png', 'The Nomadic',
      'The horse tends to move a lot. People of this age are very generous, loyal and kind. The horse is also very active, kind and talented in various fields.');
  static final Zodiac goat = Zodiac(7, 'Mùi', 'goat.png', 'The Delightful',
      'People of the goat year are very sensitive, shy and hesitant. Sometimes pessimistic, yet very kind and amicable. Easy to adapt with others.');
  static final Zodiac monkey = Zodiac(8, 'Thân', 'monkey.png', 'The Cheerful',
      'Intelligent, initiative with a good memory, the monkey is competent but not very meticulous in his work. It has great facilities to adapt in a new environment. Just one weakness: the monkey is unstable and talkative.');
  static final Zodiac rooster = Zodiac(
      9,
      'Dậu',
      'rooster.png',
      'The Self-Righteous',
      'Always busy and hardworking, the rooster enjoys working. People of the rooster age are assiduous since this sign symbolizing intellectual savant. They also like social activities and be a little dreamy.');
  static final Zodiac dog = Zodiac(10, 'Tuất', 'dog.png', 'The Loyal',
      'Year of the Dog indicates a prosperous future. Dogs are raised for house keeping, so the Year of the Dog is believed to be a very safe year. People of this age are honest, sincere, tolerant and responsible in the work as well.');
  static final Zodiac pig = Zodiac(11, 'Hợi', 'pig.png', 'The Hopeful',
      'Pigs symbolize wealth. People of the pig year are generous and brave. Despite being still quite stubborn and hot-tempered, they are very diligent and willing to listen.');

  static final Can Canh = Can(0, 'Canh');
  static final Can Tan = Can(1, 'Tân');
  static final Can Nham = Can(2, 'Nhâm');
  static final Can Quy = Can(3, 'Quý');
  static final Can Giap = Can(4, 'Giáp');
  static final Can At = Can(5, 'Ất');
  static final Can Binh = Can(6, 'Bính');
  static final Can Dinh = Can(7, 'Đinh');
  static final Can Mau = Can(8, 'Mậu');
  static final Can Ky = Can(9, 'Kỷ');

  static final CungMenh CungCanf = CungMenh(0, 'Càn');
  static final CungMenh CungKham = CungMenh(1, 'Khảm');
  static final CungMenh CungCans = CungMenh(2, 'Cấn');
  static final CungMenh CungCHan = CungMenh(3, 'Chấn');
  static final CungMenh CungTon = CungMenh(4, 'Tốn');
  static final CungMenh CungLy = CungMenh(5, 'Ly');
  static final CungMenh CungKhon = CungMenh(6, 'Khôn');
  static final CungMenh CungDoai = CungMenh(7, 'Đoài');

  List<Zodiac> _zodiacs = [
    rat,
    buffalo,
    tiger,
    cat,
    dragon,
    snake,
    horse,
    goat,
    monkey,
    rooster,
    dog,
    pig
  ];
  List<Can> _cans = [Canh, Tan, Nham, Quy, Giap, At, Binh, Dinh, Mau, Ky];

  //Zodiac Flutter Data Preparation https://docs.google.com/spreadsheets/d/1_wmEpbn4XzsAhOT3LrZ-qmVnxU9LkgnPMyRybQ73zFc/edit#gid=0

  List<CungMenh> _maleCungMenh = [
    CungKhon,
    CungKham,
    CungLy,
    CungCans,
    CungDoai,
    CungCanf,
    CungKhon,
    CungTon,
    CungCHan
  ];
  List<CungMenh> _femaleCungMenh = [
    CungTon,
    CungCans,
    CungCanf,
    CungDoai,
    CungCans,
    CungLy,
    CungKham,
    CungKhon,
    CungCHan
  ];

  Map<String, int> _cungMenhScores = {
    'Phục Vị': 1,
    'Sinh Khí': 1,
    'Thiên Y': 1,
    'Diên Niên': 1,
    'Tuyệt Mệnh': -2,
    'Ngũ Quỷ': -1,
    'Lục Sát': -1,
    'Họa Hại': -1,
  };

  List<List<String>> _cungMenh = [
    [
      'Phục Vị',
      'Lục Sát',
      'Thiên Y',
      'Ngũ Quỷ',
      'Họa Hại',
      'Tuyệt Mạng',
      'Diên Niên',
      'Sinh Khí'
    ],
    [
      'Lục Sát',
      'Phục Vị',
      'Ngũ Quỷ',
      'Thiên Y',
      'Sinh Khí',
      'Diên Niên',
      'Tuyệt Mệnh',
      'Họa Hại'
    ],
    [
      'Thiên Y',
      'Ngũ Quỷ',
      'Phục Vị',
      'Lục Sát',
      'Tuyệt Mệnh',
      'Họa Hại',
      'Sinh Khí',
      'Diên Niên'
    ],
    [
      'Ngũ Quỷ',
      'Thiên Y',
      'Lục Sát',
      'Phục Vị',
      'Diên Niên',
      'Sinh Khí',
      'Họa Hại',
      'Tuyệt Mệnh'
    ],
    [
      'Họa Hại',
      'Sinh Khí',
      'Tuyệt Mệnh',
      'Diên Niên',
      'Phục Vị',
      'Thiên Y',
      'Ngũ Quỷ',
      'Lục Sát'
    ],
    [
      'Tuyệt Mệnh',
      'Diên Niên',
      'Họa Hại',
      'Sinh Khí',
      'Thiên Y',
      'Phục Vị',
      'Lục Sát',
      'Ngũ Quỷ'
    ],
    [
      'Diên Niên',
      'Tuyệt Mệnh',
      'Sinh Khí',
      'Họa Hại',
      'Ngũ Quỷ',
      'Lục Sát',
      'Phục Vị',
      'Thiên Y'
    ],
    [
      'Sinh Khí',
      'Họa Hại',
      'Diên Niên',
      'Tuyệt Mệnh',
      'Lục Sát',
      'Ngũ Quỷ',
      'Thiên Y',
      'Phục Vị'
    ],
  ];
}

class Zodiac {
  String _assetFolder = 'assets/zodiacs/';
  int _index;
  String _name;
  String _assetIcon;
  String _title;
  String _description;

  Zodiac(
      this._index, this._name, this._assetIcon, this._title, this._description);

  int get index => _index;

  String get name => _name;

  String get assetIcon => _assetFolder + '/' + _assetIcon;

  String get description => _description;

  String get assetFolder => _assetFolder;

  String get title => _title;

  int getCompatibilityScore(Zodiac partner) {
    int gap = (partner.index - this.index).abs();
    switch (gap) {
      case 3:
        return -1;
      case 4:
        return 2;
      case 6:
        return -2;
      case 8:
        return 2;
      case 9:
        return -1;
      default:
        return 0;
    }
  }
}

class Can {
  int _index;
  String _name;

  Can(this._index, this._name);

  String get name => _name;

  int get index => _index;
}

class CungMenh {
  int _index;
  String _name;

  CungMenh(this._index, this._name);

  String get name => _name;

  int get index => _index;
}
