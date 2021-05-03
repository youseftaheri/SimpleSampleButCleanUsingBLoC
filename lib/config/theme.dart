import 'package:flutter/material.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
  EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 350.0;
}

class AppColors {
  static const red = Color(0xFFff4d4d);
  static const lightRed = Color(0xFF0080ff);
  static const darkRed = Color(0xFFff4d4d);
  static const black = Color(0xFF000000);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const lightGreen = Color(0xFF02f7b6);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const loginGradientStart = Color(0xFF80003e);
  static const loginGradientEnd = Color(0x896C79DB);
  static const warningRed = Color(0xFF990033);
  static const Color colorPrimary = Color(0xFF015BB5);
  static const Color colorPrimaryBack = Color(0x16015BB5);
  static const Color colorPrimaryBackDark = Colors.white12;
  static const Color colorPrimaryBack2 = Color(0xFFb6ffff);
  static const Color colorPrimaryDark= Color(0xFF023B73);
  static const Color colorSecondPrimary = Color(0xFF003470);
  static const Color colorSecondPinkPrimary = Color(0xFF80003e);
  static const Color colorSecondPinkPrimaryDark = Color(0xFF320018);
  static const Color whiteColor= Color(0xFFFFFFFF);
  static const Color accentSecond= Color(0xFFff4d4d);
  static const Color ticketBack= Color(0xFFcce5ff);

}
class AppDarkColors {
  static const red = Color(0xFFfc948b);
  static const lightRed = Color(0xFF0080ff);
  static const darkRed = Color(0xFFff4d4d);
  static const black = Color(0xFF000000);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const lightGreen = Color(0xFF02f7b6);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const loginGradientStart = Color(0xFF80003e);
  static const loginGradientEnd = Color(0x896C79DB);
  static const warningRed = Color(0xFF990033);
  static const Color colorPrimary = Color(0xFF0B9FBB);
  static const Color colorPrimaryBack = Color(0x160B9FBB);
  static const Color colorPrimaryBackDark = Colors.white12;
  static const Color colorPrimaryBack2 = Color(0xFFe6ffff);
  static const Color colorPrimaryDark= Color(0xFF004254);
  static const Color colorSecondPrimary = Color(0xFF004254);
  static const Color colorSecondPinkPrimary = Color(0xFF80003e);
  static const Color colorSecondPinkPrimaryDark = Color(0xFF320018);
  static const Color whiteColor= Color(0xFFFFFFFF);
  static const Color accentSecond= Color(0xFFfc948b);

  static const orange = Color(0xFFFFBA49);
  static const Color blueColor= Color(0xFF5d6afa);
  static const Color bgColor = Color(0xffF2F2F2);
  static const Color activeColor = Color(0xffF3F3F3);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color colorSecondPrimaryLight = Color(0x2280003e);
  static const Color colorAccent= Color(0XFFbfbeca);

  static const Color colorPrimaryDarkBack = lightGreen; //const Color(0x896C79DB);
}

class AppConsts {
  static const page_size = 20;
}

class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return
      theme.copyWith(
        primaryColor: AppColors.colorPrimary,
        primaryColorLight: AppColors.lightGray,
        accentColor: AppColors.colorPrimaryDark,
        bottomAppBarColor: AppColors.lightGray,
        backgroundColor: AppColors.background,
        dialogBackgroundColor: AppColors.backgroundLight,
        scaffoldBackgroundColor: AppColors.white,
        errorColor: AppColors.red,
        dividerColor: Colors.transparent,
        hoverColor: AppColors.colorPrimaryDark,
        shadowColor: AppColors.colorPrimaryBack,
        buttonColor: AppColors.red,
        cardColor: AppColors.black,

        appBarTheme: theme.appBarTheme.copyWith(
            color: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.colorPrimary),
            textTheme: theme.textTheme.copyWith(
                caption: TextStyle(
                    color: AppColors.colorPrimary,
                    fontSize: 18,
                    fontFamily: 'Iransans',
                    fontWeight: FontWeight.w400))),
        textTheme: theme.textTheme
            .copyWith(
          //over image white text
          headline: theme.textTheme.headline.copyWith(
            fontSize: 28,
            color: AppColors.white,
            fontFamily: 'Iransans',
            fontWeight: FontWeight.w600,),
          title: theme.textTheme.title.copyWith(
              fontSize: 14,
              color: AppColors.colorPrimary,
              fontWeight: FontWeight.w600,
              fontFamily: 'Iransans'), //

          //product title
          display1: theme.textTheme.display1.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Iransans'),

          display2: theme.textTheme.display2.copyWith(
              fontFamily: 'Iransans', fontWeight: FontWeight.w300),
          //product price
          display3: theme.textTheme.display3.copyWith(
              color: AppColors.lightGray,
              fontSize: 12,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w600),
          display4: theme.textTheme.display4.copyWith(
              fontFamily: 'Iransans', fontWeight: FontWeight.w500),

          subtitle: theme.textTheme.headline.copyWith(
              fontSize: 18,
              color: AppColors.colorPrimary,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w100),
          subhead: theme.textTheme.headline.copyWith(
              fontSize: 24,
              color: AppColors.darkGray,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //red button with white text
          button: theme.textTheme.button.copyWith(
              fontSize: 14,
              color: AppColors.white,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //colorPrimary caption title
          caption: theme.textTheme.caption.copyWith(
              fontSize: 24,
              color: AppColors.colorPrimary,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //light gray small text
          body1: theme.textTheme.body1.copyWith(
              color: AppColors.lightGray,
              fontSize: 11,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w200),
          //view all link
          body2: theme.textTheme.body2.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 11,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w400),
        )
            .apply(fontFamily: 'Iransans'),
        buttonTheme: theme.buttonTheme.copyWith(
          minWidth: 40,
          buttonColor: AppColors.accentSecond,
        ),
      );
  }
}

class OpenFlutterEcommerceDarkTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return
      theme.copyWith(
        primaryColor: AppColors.colorPrimary,
        primaryColorLight: AppColors.lightGray,
        accentColor: AppColors.colorPrimaryDark,
        bottomAppBarColor: AppColors.lightGray,
        backgroundColor: AppColors.background,
        dialogBackgroundColor: AppColors.backgroundLight,
        scaffoldBackgroundColor: AppColors.black,
        errorColor: AppColors.red,
        dividerColor: Colors.transparent,
        hoverColor: Colors.white,
        shadowColor: AppColors.colorPrimaryBackDark,
        buttonColor: AppColors.colorPrimaryDark,
        cardColor: AppColors.white,

        appBarTheme: theme.appBarTheme.copyWith(
            color: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.colorPrimary),
            textTheme: theme.textTheme.copyWith(
                caption: TextStyle(
                    color: AppColors.colorPrimary,
                    fontSize: 18,
                    fontFamily: 'Iransans',
                    fontWeight: FontWeight.w400))),
        textTheme: theme.textTheme
            .copyWith(
          //over image white text
          headline: theme.textTheme.headline.copyWith(
            fontSize: 28,
            color: AppColors.white,
            fontFamily: 'Iransans',
            fontWeight: FontWeight.w600,),
          title: theme.textTheme.title.copyWith(
              fontSize: 14,
              color: AppColors.colorPrimary,
              fontWeight: FontWeight.w600,
              fontFamily: 'Iransans'), //

          //product title
          display1: theme.textTheme.display1.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Iransans'),

          display2: theme.textTheme.display2.copyWith(
              fontFamily: 'Iransans', fontWeight: FontWeight.w300),
          //product price
          display3: theme.textTheme.display3.copyWith(
              color: AppColors.lightGray,
              fontSize: 12,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w600),
          display4: theme.textTheme.display4.copyWith(
              fontFamily: 'Iransans', fontWeight: FontWeight.w500),

          subtitle: theme.textTheme.headline.copyWith(
              fontSize: 18,
              color: AppColors.colorPrimary,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w100),
          subhead: theme.textTheme.headline.copyWith(
              fontSize: 24,
              color: AppColors.darkGray,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //red button with white text
          button: theme.textTheme.button.copyWith(
              fontSize: 14,
              color: AppColors.white,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //colorPrimary caption title
          caption: theme.textTheme.caption.copyWith(
              fontSize: 24,
              color: AppColors.colorPrimary,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w500),
          //light gray small text
          body1: theme.textTheme.body1.copyWith(
              color: AppColors.lightGray,
              fontSize: 11,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w200),
          //view all link
          body2: theme.textTheme.body2.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 11,
              fontFamily: 'Iransans',
              fontWeight: FontWeight.w400),
        )
            .apply(fontFamily: 'Iransans'),
        buttonTheme: theme.buttonTheme.copyWith(
          minWidth: 40,
          buttonColor: AppColors.accentSecond,
        ),
      );
  }
}
