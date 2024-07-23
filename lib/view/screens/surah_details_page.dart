import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/scheduler/binding.dart';
import 'package:the_holy_quran/model/surah_model.dart';

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
    final String response = await rootBundle
        .loadString('assets/json/dist/chapters/en/$currentSurahId.json');
    print(response);
    Map map = await json.decode(response);
    List allVerses = map['verses'];
    List<Verses>? listVerses =
        allVerses.map((e) => Verses.fromJson(map: e)).toList();
    setState(() {
      surahs = SurahModel.formJson(data: map, list: listVerses);
    });
  }

  @override
  void initState() {
    super.initState();

    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
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
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " (${surahs?.transliteration!.toString()})",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "${surahs?.name!.toString()}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${surahs?.translation!.toString()}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "verses " + surahs!.total_verses!.toString(),
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite),
                  tooltip: "Favorite",
                  onPressed: () {
                    /* ... */
                  },
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
                          top: 10, left: 10, right: 11, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.green.shade900.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Text(
                            "${surahs!.verses![index].text}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
              childCount: surahs!.verses!.length,
            ),
          ),
        ]),
      ),
    );
  }
}
