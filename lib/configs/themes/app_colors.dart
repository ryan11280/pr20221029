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

