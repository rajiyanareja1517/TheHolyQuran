import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constants.dart';

class SurahIndex extends StatefulWidget {
  const SurahIndex({super.key});

  @override
  State<SurahIndex> createState() => _SurahIndexState();
}

class _SurahIndexState extends State<SurahIndex> {
  List surahs = [];

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/data/chapters/en.json');
    final data = await json.decode(response);
    setState(() {
      surahs = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff687d5d),
          title: Text(
            "Surah Index",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )

        ),
        body: surahs.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_bg.jpg"),
                        fit: BoxFit.fill,
                        opacity: 0.5)),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: surahs.length,
                  itemBuilder: (context, index) {
                    final surah = surahs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "surah_details");
                        currentSurahId=surah['id'];

                      },
                      child: Row(
                        
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: Text(surah['id'].toString(),style: TextStyle(fontSize: 20),)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                            
                              padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green.shade900.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        surah['transliteration'],
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          surah['translation'],
                                          style: TextStyle(fontSize: 20),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Text(
                                          surah['name'],
                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Text(
                                          "Verses ${surah['total_verses']}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ));
  }
}
