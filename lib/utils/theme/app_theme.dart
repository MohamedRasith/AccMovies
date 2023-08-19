
import 'package:flutter/material.dart';
import 'package:acc_movies/utils/app_color.dart';


ThemeData ligthTheme = ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
            displayLarge: TextStyle(
              color: Colors.black,

            ),
            displayMedium: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.fade),
            bodyLarge: TextStyle(color: movieSectionText, fontSize: 16),
            titleMedium: TextStyle(color: Colors.black)

          ),
         colorScheme: ColorScheme.light(
          
          background: Colors.white,
          primary: Colors.blue,
          secondary:  Colors.black,
          surface: Colors.grey
         )

        );

ThemeData darkTheme = ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            displayLarge: TextStyle(
              color: Colors.white,

            ),
            displayMedium: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.fade),
            bodyLarge: TextStyle(color: movieSectionText, fontSize: 16),
            titleMedium: TextStyle(color: Colors.white)

          ),
         colorScheme: ColorScheme.dark(
          
          background: darkBackground,
          primary: Colors.blue,
          secondary:  Colors.white,
          surface: Colors.grey
         )

        );