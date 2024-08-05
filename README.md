# the_holy_quran

A the_holy_quran project created in flutter. the_holy_quran supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/the_holy_quran

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/the_holy_quran.git
```


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- model/
|- network/
|- provider/
|- view/screen/
|- widgets/
|- utils/
|- main.dart
```

### view/screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- SplashScreen.dart
|- HomePage.dart
|- SurahIndex.dart
|- SurahDetailsPage.dart
|- BookMarkPage.dart
```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- Constants/

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart

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
    

```


https://github.com/user-attachments/assets/c848ee12-b2aa-4932-880e-702e83aa25a4

![Screenshot_20240804_171513](https://github.com/user-attachments/assets/37376a96-aa50-436a-b8fd-4dc9754e3a33)
![Screenshot_20240804_171717](https://github.com/user-attachments/assets/d254f745-81e1-4477-acab-ab8befda3e8d)
![Screenshot_20240804_171704](https://github.com/user-attachments/assets/387e3f89-2477-4ec5-bad2-31a723e617c2)
![Screenshot_20240804_171633](https://github.com/user-attachments/assets/4501255d-e7c0-4f61-ac87-79e2a8582b20)
![Screenshot_20240804_171603](https://github.com/user-attachments/assets/b27f9579-b3fa-41f5-ab59-0684c0173fb7)
![Screenshot_20240804_171550](https://github.com/user-attachments/assets/774c7e04-ddb6-4b06-9589-2a28e4e39437)
![Screenshot_20240804_171523](https://github.com/user-attachments/assets/663af94b-37fd-449b-9a79-f1631f672d8f)
![Screenshot_20240804_171735](https://github.com/user-attachments/assets/d67dff4f-20e3-4f8f-8bdb-2286e4cc886d)
![Screenshot_20240804_171750](https://github.com/user-attachments/assets/bd277061-98b2-4413-8a6b-759de73839d0)



## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
