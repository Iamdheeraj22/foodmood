import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/res/colors/colors.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      //fontFamily: FontFamily.appFontFamily,
      primarySwatch: AppColors.materialColorPrimarySwatch,
      primaryColor: AppColors.colorPrimary,
      disabledColor: Colors.grey,
      // colorScheme: ColorScheme.light(secondary: AppColors.appGreen,primary: AppColors.appGreen), // ColorScheme to change circular progress and scroll ripple
      // cardColor: AppColors.cardColorLight,
      // canvasColor: AppColors.colorBackground,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      hintColor: Colors.grey,
      /*iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppColors.colorAccent),*/
      inputDecorationTheme: const InputDecorationTheme(
          //hintStyle: TextStyle(color: AppColors.colorSecondary),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              //  primary: AppColors.colorPrimary,
              //minimumSize: Size(double.infinity, SizeConfig.size_50),
              )),
      dividerColor: Colors.grey.withOpacity(0.7),
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.colorPrimary,
          // elevation: ,
          contentTextStyle: const TextStyle(color: Colors.white)),
      floatingActionButtonTheme: Theme.of(context)
          .floatingActionButtonTheme
          .copyWith(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.black,
              splashColor: AppColors.colorPrimary.withOpacity(0.7)),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light(),
          buttonColor: AppColors.colorPrimary,
          splashColor: AppColors.colorPrimary.withOpacity(0.7)),
/*      tabBarTheme: TabBarTheme(
          //  unselectedLabelColor: Colors.black,
          labelColor: AppColors.colorPrimary),*/
      //labelPadding: const EdgeInsets.all(4),

      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      //fontFamily: FontFamily.appFontFamily,
      primarySwatch: AppColors.materialColorPrimarySwatch,
      // primaryColor: AppColors.colorPrimary,
      disabledColor: Colors.grey,
      //cardColor: AppColors.cardColorDark,
      // colorScheme: ColorScheme.light(secondary: AppColors.appGreen,primary: AppColors.appGreen), // ColorScheme to change circular progress and scroll ripple
      //cardColor: Colors.white,
      // canvasColor: AppColors.colorBackground,
      brightness: Brightness.dark,
      //scaffoldBackgroundColor: AppColors.scaffoldBgColorDark,
      hintColor: Colors.grey,
      /* iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppColors.colorAccent),*/
      inputDecorationTheme:
          const InputDecorationTheme(hintStyle: TextStyle(color: Colors.grey)),
      dividerColor: Colors.grey.withOpacity(0.7),
      // backgroundColor: Colors.white54,
      //scaffoldBackgroundColor: AppColors.colorPrimary,
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.colorPrimary,
          //elevation: SizeConfig.standardElevation,
          contentTextStyle: const TextStyle(color: Colors.white)),
      floatingActionButtonTheme: Theme.of(context)
          .floatingActionButtonTheme
          .copyWith(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Colors.white,
              splashColor: AppColors.colorPrimary.withOpacity(0.7)),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light(),
          buttonColor: AppColors.colorPrimary,
          splashColor: AppColors.colorPrimary.withOpacity(0.7)),
      // progressIndicatorTheme:
      // ProgressIndicatorThemeData(color: AppColors.blueDeFrance),
      bottomNavigationBarTheme: Theme.of(context)
          .bottomNavigationBarTheme
          .copyWith(
            backgroundColor: CupertinoColors.tertiarySystemGroupedBackground,
            // elevation: SizeConfig.smallerFontSize,
            selectedItemColor: AppColors.materialColorPrimarySwatch,
            // selectedLabelStyle:
            // TextStyle(fontSize: SizeConfig.standardFontSize),
            // unselectedLabelStyle:
            // TextStyle(fontSize: SizeConfig.standardFontSize),
          ),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
          color: Colors.transparent,
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.white),
          //elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white)),
    );
  }

  void setSystemDefault() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  void setDarkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setLightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }
}

AppTheme appTheme = AppTheme();
