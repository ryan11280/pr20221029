import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr20221029/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xCD052442);
const Color primaryColorLight = Color(0xB26B8FAD);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color backgroundColorLight = Color(0x45445858);

//最高級的theme設定
class LightTheme with SubThemeData {
  //用了mixin後要用with，不能用extends
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
          bodyColor: mainTextColorLight, displayColor: mainTextColorLight),
      backgroundColor: backgroundColorLight,
    );
  }
}
