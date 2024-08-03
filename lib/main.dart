import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:the_holy_quran/providers/language_provider.dart';
import 'package:the_holy_quran/view/screens/home_page.dart';
import 'package:the_holy_quran/view/screens/bookmark_page.dart';
import 'package:the_holy_quran/view/screens/splash_screen.dart';
import 'package:the_holy_quran/view/screens/surah_index_page.dart';

import 'view/screens/surah_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [ChangeNotifierProvider(create: (context) => LanguageProvide(),)],
      builder:(context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.amiriTextTheme(),
        ),
          routes: {
            'home': (context) => HomePage(),
            '/': (context) => SplashScreen(),
            'surah_index': (context) => SurahIndex(),
            'surah_details': (context) => SurahDetailsPage(),
            'bookmark': (context) => BookMarkPage(),
          },
        );
      },
    );
  }
}
