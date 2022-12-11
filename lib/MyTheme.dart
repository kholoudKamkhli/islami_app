import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimary = Color(0xFFFB7935F);
  static const Color darkPrimary = Color(0xFFF141A2E);
  static const Color yellow = Color(0xFFFACC1D);
  static var lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(18) ,
          topRight: Radius.circular(18),
        ),
      )
    ),
    accentColor: lightPrimary,
     cardColor: Colors.white,
     textTheme: TextTheme(
       headline6: TextStyle(
         fontSize: 22,
         color: Colors.black,
       ),
       headline4: TextStyle(
       fontSize: 28,
       color: Colors.black,
     ),
       subtitle2: TextStyle(
       fontSize: 14,
       color: Colors.black,
     )
     ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightPrimary,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color:Colors.black,
      ),
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: darkPrimary,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      selectedLabelStyle: const TextStyle(
        color: Colors.black,
    ),
      selectedItemColor: Colors.black,

  ),);
  static var darkTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(18) ,
            topRight: Radius.circular(18),
          ),
        )
    ),
    cardColor: darkPrimary,
    accentColor: yellow,
    textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
        headline4: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          color: Colors.white,
        )

    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkPrimary,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
      color:Colors.white,
  ),
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: yellow,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      selectedLabelStyle: const TextStyle(
        color: yellow,
      ),
      selectedItemColor: yellow,

    ),);
}