import 'dart:core';

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology
//https://medium.com/@phonglinhgems/h%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-c%C3%A1ch-t%C3%ADnh-can-chi-theo-tu%E1%BB%95i-%C3%A2m-l%E1%BB%8Bch-2e8572b65c51
//I know that the year 0004 is the year of rat. And no one should be alive if
// they were born before the year of 4
const int RAT_YEAR = 4;

class AstrologyBrain {
  static AstrologyBrain _instance;
  static AstrologyBrain getInstance() {
    if (_instance == null) {
      _instance = new AstrologyBrain();
    }
    return _instance;
  }

  static Zodiac rat = Zodiac(0, 'Tí', 'rat.png', 'The Smart',
      'The rat is very sociable and dynamic. People of the Rat year has a great self-confidence on the appearance.');
  static Zodiac buffalo = Zodiac(1, 'Sửu', 'buffalo.png', 'The Born Leader',
      'The buffalo represent diligence and patience. People of the buffalo year usually have a slow but steady progression. Also, they are imperturbable and steadfast but stubborn.');
  static Zodiac tiger = Zodiac(
      2,
      'Dần',
      'tiger.png',
      'The Powerful',
      'Very sensitive, yet the tiger often worries and gets angry quickly. '
          'However, people of the tiger year are very indecisive when there are decisions need to be made. Despite being hot-tempered, they can adapt well to any circumstances.');
  static Zodiac cat = Zodiac(3, 'Mão', 'cat.png', 'The Flexible',
      'People of the cat year achieve a lot of success in the work while remaining very modest and patient. They are soft-spoken, ambitious yet talented.');
  static Zodiac dragon = Zodiac(4, 'Thìn', 'dragon.png', 'The Holy',
      'The dragon symbolizes royal authority, power and prosperity. People of this age are very active and have great facilities to become rich.');
  static Zodiac snake = Zodiac(5, 'Tị', 'snake.png', 'The Lucky',
      'Very wise and courageous, people of this age can easily succeed in the work. They are also sympathetic, determined yet intolerant.');
  static Zodiac horse = Zodiac(6, 'Ngọ', 'horse.png', 'The Nomadic',
      'The horse tends to move a lot. People of this age are very generous, loyal and kind. The horse is also very active, kind and talented in various fields.');
  static Zodiac goat = Zodiac(7, 'Mùi', 'goat.png', 'The Delightful',
      'People of the goat year are very sensitive, shy and hesitant. Sometimes pessimistic, yet very kind and amicable. Easy to adapt with others.');
  static Zodiac monkey = Zodiac(8, 'Thân', 'monkey.png', 'The Cheerful',
      'Intelligent, initiative with a good memory, the monkey is competent but not very meticulous in his work. It has great facilities to adapt in a new environment. Just one weakness: the monkey is unstable and talkative.');
  static Zodiac rooster = Zodiac(9, 'Dậu', 'rooster.png', 'The Self-Righteous',
      'Always busy and hardworking, the rooster enjoys working. People of the rooster age are assiduous since this sign symbolizing intellectual savant. They also like social activities and be a little dreamy.');
  static Zodiac dog = Zodiac(10, 'Tuất', 'dog.png', 'The Loyal',
      'Year of the Dog indicates a prosperous future. Dogs are raised for house keeping, so the Year of the Dog is believed to be a very safe year. People of this age are honest, sincere, tolerant and responsible in the work as well.');
  static Zodiac pig = Zodiac(11, 'Hợi', 'pig.png', 'The Hopeful',
      'Pigs symbolize wealth. People of the pig year are generous and brave. Despite being still quite stubborn and hot-tempered, they are very diligent and willing to listen.');

  static Can Canh = Can(0, 'Canh');
  static Can Tan = Can(1, 'Tân');
  static Can Nham = Can(2, 'Nhâm');
  static Can Quy = Can(3, 'Quý');
  static Can Giap = Can(4, 'Giáp');
  static Can At = Can(5, 'Ất');
  static Can Binh = Can(6, 'Bính');
  static Can Dinh = Can(7, 'Đinh');
  static Can Mau = Can(8, 'Mậu');
  static Can Ky = Can(9, 'Kỷ');

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

  String getYearName(int year) {
    return _cans[year % 10].name +
        ' ' +
        _zodiacs[(year - RAT_YEAR) % 12].name; // + ' - ' + yearZodiac.title;
  }

  String getAssetImagePath(int year) {
    return _zodiacs[(year - RAT_YEAR) % 12].assetIcon;
  }
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

class Menh {
  int _index;
  String _name;
}
