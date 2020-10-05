import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//https://www.vietnamparadisetravel.com/blog/vietnamese-zodiac-animals-and-astrology
//https://medium.com/@phonglinhgems/h%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-c%C3%A1ch-t%C3%ADnh-can-chi-theo-tu%E1%BB%95i-%C3%A2m-l%E1%BB%8Bch-2e8572b65c51

class AstrologyBrain {

  List<Zodiac> _zodiacs;
  Map<Zodiac, Zodiac> _greatMatches; //the zodiac with smaller index is used as key
  Map<Zodiac, Zodiac> _badMatches; //the zodiac with smaller index is used as key

  static Zodiac rat = Zodiac(0, 'Tí', 'rat.png', 'The Smart',
      'The rat is very sociable and dynamic. People of the Rat year has a great self-confidence on the appearance.');
  static Zodiac buffalo = Zodiac(1, 'Sửu', 'buffalo.png', 'The Born Leader',
      'The buffalo represent diligence and patience. People of the buffalo year usually have a slow but steady progression. Also, they are imperturbable and steadfast but stubborn.');
  static Zodiac tiger = Zodiac(2, 'Dần', 'tiger.png', 'The Powerful',
      'Very sensitive, yet the tiger often worries and gets angry quickly. However, people of the tiger year are very indecisive when there are decisions need to be made. Despite being hot-tempered, they can adapt well to any circumstances.')
  static Zodiac cat = Zodiac(3, 'Mão', 'cat.png', 'The Flexible',
      'People of the cat year achieve a lot of success in the work while remaining very modest and patient. They are soft-spoken, ambitious yet talented.');
  static Zodiac dragon = Zodiac(4, 'Thìn', 'dragon.png', 'The Holy',
      'The dragon symbolizes royal authority, power and prosperity. People of this age are very active and have great facilities to become rich.');
  static Zodiac snake = Zodiac(5, 'Tị', 'snake.png', 'The Lucky', 'Very wise and courageous, people of this age can easily succeed in the work. They are also sympathetic, determined yet intolerant.');
  static  Zodiac horse = Zodiac(6, 'Ngọ', 'horse.png', 'The Nomadic', 'The horse tends to move a lot. People of this age are very generous, loyal and kind. The horse is also very active, kind and talented in various fields.');
  static  Zodiac goat = Zodiac(7, 'Mùi', 'goat.png', 'The Delightful', 'People of the goat year are very sensitive, shy and hesitant. Sometimes pessimistic, yet very kind and amicable. Easy to adapt with others.');
  static Zodiac monkey = Zodiac(8, 'Thân', 'monkey.png', 'The Cheerful', 'Intelligent, initiative with a good memory, the monkey is competent but not very meticulous in his work. It has great facilities to adapt in a new environment. Just one weakness: the monkey is unstable and talkative.');
  static Zodiac rooster = Zodiac(9, 'Dậu', 'rooster.png', 'The Self-Righteous', 'Always busy and hardworking, the rooster enjoys working. People of the rooster age are assiduous since this sign symbolizing intellectual savant. They also like social activities and be a little dreamy.');
  static Zodiac dog = Zodiac(10, 'Tuất', 'dog.png', 'The Loyal', 'Year of the Dog indicates a prosperous future. Dogs are raised for house keeping, so the Year of the Dog is believed to be a very safe year. People of this age are honest, sincere, tolerant and responsible in the work as well.');
  static Zodiac pig = Zodiac(11, 'Hợi', 'pig.png', 'The Hopeful', 'Pigs symbolize wealth. People of the pig year are generous and brave. Despite being still quite stubborn and hot-tempered, they are very diligent and willing to listen.');



  void generateZodiacsData(){
    if( _zodiacs != null ) {      _zodiacs.clear();    }
    _zodiacs = [rat, buffalo, tiger, cat, dragon, snake, horse, goat, monkey, rooster, dog, pig];
    _greatMatches = {};
  }

  YearSigns getYearSigns(int year){

  }
}

class Zodiac{
  String _assetFolder = 'assets/zodiacs/';
  int index;
  String name;
  String assetIcon;
  String title;
  String description;
  List<Zodiac> greatMatch;
  List<Zodiac> badMatch;
  int getCompatibilityScore(Zodiac ){
    //TODO: return -1 for bad match, 1 for good match, 0 for OKish
    return 0;
  }

  Zodiac(this.index, this.name, this.assetIcon, this.title, this.description);
}

class YearSigns {
  Zodiac zodiac;
  String Can;
  String Menh;
}

