import 'package:flutter/material.dart';

import 'color.dart';

import 'fontstyles.dart';

ThemeData appTheme = ThemeData(

  primaryColorDark: bgColor,
  primaryColorLight: bgColor,
  bottomAppBarColor: bottomAppColor,
  brightness: Brightness.light,
  primaryColor: primaryColor,
  backgroundColor: bgColor,
  canvasColor: canvasColor,
  dividerColor: dividerColor,
  scaffoldBackgroundColor: bgColor,
  hintColor: hintColor,
  disabledColor: disableColor,
  fontFamily: "Kanit",
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  buttonTheme: const ButtonThemeData(),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.symmetric(horizontal: 13, vertical: 3)),
      // foregroundColor:
      // MaterialStateProperty.resolveWith((states) => textColor(states)),
      foregroundColor: MaterialStateProperty.all<Color>(canvasColor),
      textStyle: MaterialStateProperty.resolveWith(outlinedButtonTextStyle),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      shape: MaterialStateProperty.resolveWith(outlinedBorder),
      elevation: MaterialStateProperty.resolveWith(elevation),
      side: MaterialStateProperty.resolveWith((states) => borderColor(states)),
    ),
  ),

  // outlinedButtonTheme: ,


  textTheme: TextTheme(
      headline3: extraBold,
      //900
      //24
      headline4: extraBold.copyWith(fontSize: 12),
      headline1: bold,
      //700
      //18
      button: bold.copyWith(fontSize: 16),
      headline2: bold.copyWith(fontSize: 14),
      headline5: bold.copyWith(fontSize: 12),
      subtitle1: medium,
      //500
      //14
      subtitle2: medium.copyWith(fontSize: 12),
      headline6: medium.copyWith(fontSize: 10),
      bodyText1: regular,
      //400
      //11
      bodyText2: regular.copyWith(fontSize: 12),
      caption: regular.copyWith(color: hintColor, fontSize: 12)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.resolveWith(shadowColor),
      shape: MaterialStateProperty.resolveWith(outlinedBorder),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(horizontal: 5)),
      elevation: MaterialStateProperty.resolveWith(elevation),

      // foregroundColor: MaterialStateProperty.resolveWith(backgroundColor),
      backgroundColor: MaterialStateProperty.resolveWith(backgroundColor),
      textStyle: MaterialStateProperty.resolveWith(textStyle),
    ),
  ),

);

const Set<MaterialState> states = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.selected
};

OutlinedBorder? outlinedBorder(state) {
  if (state == MaterialState.disabled) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  } else {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }
}

double? elevation(state) {
  if (state == MaterialState.disabled) {
    return 0.0;
  }

  if (states.contains(state)) {
    return 15.0;
  }
}

Color? backgroundColor(Set<MaterialState> state) {
  if (state.contains(MaterialState.disabled)) {
    return hintColor;
  }
  else{
    return bgColor;
  }
}

TextStyle? textStyle(Set<MaterialState> state) {
  print("Text: $state");
  return bold.copyWith(
      color: canvasColor,
      fontFamily: 'Kanit',fontSize: 14
  );
}

TextStyle? textButtonTextStyle(Set<MaterialState> state) {
  print("Text: $state");
  return medium.copyWith(color: Colors.black, fontSize: 16);
}

TextStyle? outlinedButtonTextStyle(Set<MaterialState> state) {
  if (state.contains(MaterialState.disabled)) {
    return medium.copyWith(color: disableColor, fontSize: 16);
  } else {
    return medium.copyWith(color: primaryColor, fontSize: 16);
  }
}

Color? shadowColor(Set<MaterialState> state) {
  return primaryColor;
}

Color? textColor(Set<MaterialState> state) {
  if (state.contains(MaterialState.disabled)) {
    return disableColor;
  } else {
    return canvasColor;
  }
}

BorderSide? borderColor(Set<MaterialState> state) {
  if (state.contains(MaterialState.disabled)) {
    return const BorderSide(color: disableColor);
  } else {
    return const BorderSide(color: bgColor);
  }
}