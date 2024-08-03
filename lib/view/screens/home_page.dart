import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/language_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/app_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String selectedRadio = "English";

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> _setLanguageCode(String code) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('code',code)!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff687d5d),

      ),
      backgroundColor: Color(0xff687d5d),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/logos/logo.png",
                  height: 220,
                  color: Colors.white,
                  opacity: const AlwaysStoppedAnimation(.5),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/quranRail.png",
                  height: 350,
                  opacity: const AlwaysStoppedAnimation(.4),
                ),
              ),
              const AppName(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "surah_index");
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 4.0))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Surah Index",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "bookmark");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26, offset: Offset(2, 4.0))
                            ],
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Bookmarks",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox.expand(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "Select Language",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ...Constants.language
                                              .map((e) => RadioListTile(
                                            activeColor: Color(0xff687d5d),
                                            value: e.name,
                                            title: Text(
                                              e.name,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            groupValue: selectedRadio,
                                            onChanged: (value) {
                                              handleRadioValueChange(value!, context);
                                              _setLanguageCode(e.code);
                                              Provider.of<LanguageProvide>(context,listen: false).setLanguageCode();
                                            },
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26, offset: Offset(2, 4.0))
                            ],
                            color: Colors.red.shade100,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Language",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "\"Indeed, It is We who sent down the Qur'an\nand indeed, We will be its Guardian\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Surah Al-Hijr\n",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleRadioValueChange(String value, BuildContext context) {
    selectedRadio = value;
    Navigator.of(context).pop();
  }
}
