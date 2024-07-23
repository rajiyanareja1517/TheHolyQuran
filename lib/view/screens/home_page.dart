import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/app_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff687d5d),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 32,
              ))
        ],
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
                        //Navigator.pushNamed(context, AppRoutes.juz);
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
                          "Juzz Index",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, AppRoutes.bookmarks);
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
}
