import 'package:the_holy_quran/utils/constants.dart';

class SurahModel {
  int? id;
  String? name;
  String? transliteration;
  String? translation;
  String? type;
  bool fav=false;
  int? total_verses;
  List<Verses>? verses;

  factory SurahModel.formJson({required Map data,required List<Verses>? list,required fav}) {
    SurahModel model = SurahModel(
        id: data['id'],
        name: data['name'],
        transliteration: data['transliteration'],
        translation: data['translation'],
        type: data['type'],
        total_verses: data['total_verses'],
        verses: list,
        fav: fav
    );
    return model;
  }

  SurahModel(
      {required this.id,
      required this.name,
      required this.transliteration,
      required this.translation,
      required this.type,
      required this.total_verses,
      required this.verses,
      required this.fav
      }
      );
}
bool getIsFav(){
  for(int i=0;i<Constants.favData.length;i++){
    if(Constants.currentSurahId==Constants.favProductData[i].id){
      return true;
    }
  }
  return false;
}

class Verses {
  int? id;
  String? text;
  String? translation;
  String? transliteration;

  Verses(
      {required this.id,
      required this.text,
      required this.translation,
      required this.transliteration});

  factory Verses.fromJson({required Map map}) {
    return Verses(
        id: map['id'],
        text: map['text'],
        translation: map['translation'],
        transliteration: map['transliteration']);
  }
}
