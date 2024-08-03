import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvide extends ChangeNotifier {
  String code = "en";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setLanguageCode() async {
    final SharedPreferences prefs = await _prefs;
    code = prefs.getString('code')!;

  }
}
