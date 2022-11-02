import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr20221029/configs/themes/app_dark_theme.dart';
import 'package:pr20221029/configs/themes/app_light_theme.dart';
import 'package:pr20221029/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColorLight, primaryLightColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColorDark, primaryDarkColorDark]);
//亮色/深色模式判斷
LinearGradient mainGradient(BuildContext context)=>
    UIParameters.isDarkMode(context)?mainGradientDark:mainGradientLight;

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

const kTopicColor = Color(0xFF111E5E);
