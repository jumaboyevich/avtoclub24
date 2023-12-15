import 'dart:io';

import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
const black = _black;
 */
abstract class AppTheme {
  static ThemeData theme() => ThemeData(
      scaffoldBackgroundColor: scaffoldColor,
      fontFamily: 'Inter',
      splashColor: dark,
      highlightColor: Colors.transparent,
      primaryColor: dark,
      primaryColorLight: white,
      primaryColorDark: dark,
      hintColor: dark,
      disabledColor: dark.withOpacity(0.4),
      hoverColor: dark,
      
      shadowColor: dark.withOpacity(0.36),
      unselectedWidgetColor: dark,
      cardColor: dark,
      focusColor: dark,
      canvasColor: dark,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent, modalBackgroundColor: white),
      iconTheme: const IconThemeData(color: dark),
      dividerTheme: const DividerThemeData(color: dark),
      secondaryHeaderColor: dark,
      toggleButtonsTheme: const ToggleButtonsThemeData(focusColor: dark),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: white,
          selectedItemColor: dark,
          unselectedItemColor: dark,
          selectedLabelStyle: TextStyle(color: dark, fontWeight: FontWeight.w600, fontSize: 11),
          unselectedLabelStyle: TextStyle(color: dark, fontWeight: FontWeight.w400, fontSize: 11),
          selectedIconTheme: IconThemeData(color: white),
          unselectedIconTheme: IconThemeData(color: grey)),
      dividerColor: dark,
      bannerTheme: const MaterialBannerThemeData(backgroundColor: grey),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: dark),
        titleTextStyle: displayMedium.copyWith(color: dark),
        centerTitle: true,
        backgroundColor: scaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Platform.isIOS ? scaffoldColor : white,
          statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
        ),
      ),
      tabBarTheme: TabBarTheme(
          indicatorColor: dark,
          labelColor: dark,
          indicator: BoxDecoration(color: dark, borderRadius: BorderRadius.circular(7))),
      radioTheme: const RadioThemeData(
          visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      sliderTheme: SliderThemeData(
          valueIndicatorColor: grey,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
          overlayShape: SliderComponentShape.noOverlay),
      listTileTheme:
          const ListTileThemeData(style: ListTileStyle.drawer, textColor: grey, tileColor: dark, iconColor: grey),
      cardTheme: const CardTheme(color: grey, surfaceTintColor: grey),
      popupMenuTheme: const PopupMenuThemeData(color: grey, surfaceTintColor: grey),
      drawerTheme: const DrawerThemeData(backgroundColor: grey, scrimColor: grey),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: dark),
      textTheme: const TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall),
      colorScheme: ColorScheme(
          background: white.withOpacity(0.1),
          brightness: Brightness.light,
          primary: scaffoldColor,
          secondary: dark.withOpacity(0.32),
          secondaryContainer: dark,
          onSecondaryContainer: dark.withOpacity(0.14),
          error: red,
          surface: dark,
          onPrimary: dark,
          onSecondary: dark,
          onBackground: white,
          onError: red,
          onSurface: dark,
          scrim: dark.withOpacity(0.32),
          onPrimaryContainer: dark.withOpacity(0.64)));

  // Fonts
  static const displayLarge = TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: dark);
  static const displayMedium = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: dark);
  static const displaySmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: dark);
  static const headlineLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: dark);
  static const headlineMedium = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: dark);
  static const headlineSmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: dark);
  static const titleLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: dark);
  static const titleMedium = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: dark);
  static const titleSmall = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: dark);
  static const bodyLarge = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: dark, letterSpacing: .41);
  static const bodyMedium = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: black, letterSpacing: .07);
  static const bodySmall = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: dark);
  static const labelLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: dark);
  static const labelMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: dark);
  static const labelSmall = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: dark, letterSpacing: .41);
}

LinearGradient shimmerFeatureDarkMode =
    LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
  const Color(0xffB9BBC9).withOpacity(0.10),
  const Color(0xffF0F0F5).withOpacity(0.4),
]);
LinearGradient shimmerFeature = LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
  const Color(0xffB9BBC9).withOpacity(0.24),
  const Color(0xffF0F0F5),
]);
