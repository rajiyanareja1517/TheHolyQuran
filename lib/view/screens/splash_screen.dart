import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_holy_quran/view/screens/home_page.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage(),))
    ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff687d5d),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/logos/logo.png",color: Colors.white,),
      ),
    );
  }
}
