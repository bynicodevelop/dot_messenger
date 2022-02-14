import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static final ThemeData defaultTheme = _buildCustomThemeData();

  static ThemeData _buildCustomThemeData() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: kDefaultBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: kDefaultBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: kDefaultPadding / 15,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: const TextStyle(
          color: Colors.black,
          fontSize: kDefaultFontSize,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: const TextStyle(
          color: Color(0xFFA3A3A3),
          fontStyle: FontStyle.italic,
          fontSize: kDefaultFontSize / 1.1,
          fontWeight: FontWeight.w400,
          letterSpacing: .7,
        ),
        caption: TextStyle(
          color: Colors.grey[600]!,
          fontSize: kDefaultFontSize / 1.7,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
        headline1: const TextStyle(
          color: Colors.black,
          fontSize: kDefaultFontSize * 1.9,
          fontWeight: FontWeight.w400,
        ),
        headline6: const TextStyle(
          color: Colors.black,
          fontSize: kDefaultFontSize * 1.5,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: const TextStyle(
          color: Colors.black,
          fontSize: kDefaultFontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: kDefautColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kDefaultPadding / 3,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(kDefaultPadding / 1.2),
        labelStyle: TextStyle(
          color: Colors.grey[800]!,
          fontSize: kDefaultFontSize,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultPadding / 4,
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey[500]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultPadding / 4,
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey[500]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kDefaultPadding / 4,
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey[500]!,
          ),
        ),
      ),
    );
  }
}
