import 'dart:convert';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_holy_quran/model/surah_model.dart';
import 'package:the_holy_quran/providers/language_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';

//assets/json/dist/chapters/es/1.json
class SurahDetailsPage extends StatefulWidget {
  const SurahDetailsPage({super.key});

  @override
  State<SurahDetailsPage> createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
   SurahModel? surahs;

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString(
        'assets/json/dist/chapters/${Provider.of<LanguageProvide>(context, listen: false).code}/${Constants.currentSurahId}.json');
    print(response);
    Map map = await json.decode(response);
    List allVerses = map['verses'];
    List<Verses>? listVerses =
        allVerses.map((e) => Verses.fromJson(map: e)).toList();
    setState(() {
      surahs = SurahModel.formJson(data: map, list: listVerses, fav: getIsFav());
    });
  }

  @override
  void initState() {
    super.initState();

    loadJsonData();
  }

  Icon favIcon = Icon(
    Icons.favorite, // Icons.favorite
    color: Colors.red.shade900, // Colors.red
  );
  Icon unfavIcon = Icon(
    Icons.favorite, // Icons.favorite_border
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: surahs==null ? Center(child: CircularProgressIndicator())
            :
        CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverAppBar(
              expandedHeight: 170.0,
              backgroundColor: Color(0xff687d5d),
              pinned: true,
              snap: true,
              floating: true,
              collapsedHeight: 80.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        " (${surahs?.transliteration!.toString()}) ${surahs?.name!.toString()}            ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${surahs?.translation!.toString()}            ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        child: (surahs == null)
                            ? Text("--")
                            : Text(
                                "verses " + surahs!.total_verses!.toString(),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: surahs!.fav ? favIcon : unfavIcon,
                  tooltip: "Favorite",
                  onPressed: () {
                    setState(() {
                      if (surahs!.fav) {
                        surahs!.fav=false;
                        Constants.favData.remove(surahs!);
                        Constants.favProductData.remove(surahs!);
                        Constants.covertUniqueData();

                      } else {
                        surahs!.fav=true;
                        Constants.favData.add(surahs!);
                        Constants.covertUniqueData();
                      }
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox.expand(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Surah Info",
                                      style: TextStyle(fontSize: 27),
                                    ),
                                  ),
                                  Text(
                                    "Juz Number: \n" +
                                        quran
                                            .getJuzNumber(
                                                Constants.currentSurahId, 1)
                                            .toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  /*  Text("\nSurah and Verses in Juz ${quran.getJuzNumber(Constants.currentSurahId, 1)}: \n" + quran.getSurahAndVersesFromJuz(Constants.currentSurahId).toString()),*/
                                  Text("\nSurah Name: \n" +
                                      quran.getSurahName(
                                          Constants.currentSurahId),
                                    style: TextStyle(fontSize: 20),),
                                  Text("\nSurah Name (English): \n" +
                                      quran.getSurahNameEnglish(
                                          Constants.currentSurahId),
                                    style: TextStyle(fontSize: 20),),
                                 /* Text("\nSurah URL: \n" +
                                      quran
                                          .getSurahURL(Constants.currentSurahId)),*/
                                  Text("\nTotal Verses: \n" +
                                      quran
                                          .getVerseCount(Constants.currentSurahId)
                                          .toString(), style: TextStyle(fontSize: 20),),
                                  Text("\nPlace of Revelation: \n" +
                                      quran.getPlaceOfRevelation(
                                          Constants.currentSurahId), style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.info),
                  color: Colors.white,
                ),
              ]),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  decoration: BoxDecoration(),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 11, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.green.shade900.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Text(
                            "${surahs!.verses![index].text}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "(${surahs!.verses![index].transliteration})",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${surahs!.verses![index].translation}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )),
                );
              },
              childCount: (surahs == null) ? 0 : surahs!.verses!.length,
            ),
          ),
        ]),
      ),
    );
  }

  /*_launchURL(String urll) async {
    final Uri url = Uri.parse("${urll}");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }*/
}
