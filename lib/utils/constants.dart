import 'package:the_holy_quran/model/language.dart';
import 'package:the_holy_quran/model/surah_model.dart';

class Constants {
  static Set<SurahModel> favData = {};
  static List<SurahModel> favProductData = [];

  static late int currentSurahId;
  static List<LanguageModel> language = [
    LanguageModel(name: "English", code: "en"),
    LanguageModel(name: "Bengali", code: "bn"),
    LanguageModel(name: "Spanish", code: "es"),
    LanguageModel(name: "French", code: "fr"),
    LanguageModel(name: "Indonesia", code: "id"),
    LanguageModel(name: "Russian", code: "ru"),
    LanguageModel(name: "Swedish", code: "sv"),
    LanguageModel(name: "Turkish", code: "tr"),
    LanguageModel(name: "Urdu", code: "ur"),
    LanguageModel(name: "Chinese", code: "zh"),
  ];
  static void covertUniqueData() {
    favProductData = favData.toList();
  }
}
