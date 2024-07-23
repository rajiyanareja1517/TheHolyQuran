import 'package:flutter/material.dart';
import 'package:the_holy_quran/view/screens/home_page.dart';
import 'package:the_holy_quran/view/screens/splash_screen.dart';
import 'package:the_holy_quran/view/screens/surah_index.dart';

import 'view/screens/surah_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      routes: {
        'home': (context) => HomePage(),
        '/': (context) => SplashScreen(),
        'surah_index': (context) => SurahIndex(),
        'surah_details': (context) => SurahDetailsPage(),
      },
    );
  }
}
