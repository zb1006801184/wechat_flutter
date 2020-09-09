import 'package:flutter/material.dart';
import 'package:wechat_flutter/state/them_model.dart';
import '../state/provider_store.dart';

class ThemUntil {
  static const String THEMSTATE = 'them_state'; //主题模式
  static const Color mainColor = Color.fromRGBO(248, 248, 248, 1);

  //正常模式
  ThemeData linghtData = ThemeData(
    textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFF181818))),
    scaffoldBackgroundColor: Color(0xFFEDEDED),
    primaryColor: mainColor,
  );
  //深色模式
  final ThemeData darktData = ThemeData(
      scaffoldBackgroundColor: Color(0xFF121212),
      primaryColor: Color(0xFF181818),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)));

  //tabbar 和 导航栏的颜色
  Color tabbarColor(BuildContext context) {
    return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFF181818)
        : mainColor;
  }

  //状态栏
  Brightness stateBarColor(BuildContext context) {
    return Store.value<ThemModel>(context).getThemeModel()
        ? Brightness.dark
        : Brightness.light;
  }

  //主要文本颜色

}
