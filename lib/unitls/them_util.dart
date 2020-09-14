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

  //tabbar 
  Color tabbarColor(BuildContext context) {
    return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFF181818)
        : mainColor;
  }
  //导航栏的颜色
  Color navColor(BuildContext context){
    return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFF181818)
        : Color(0xFFEDEDED);
  }

  //状态栏
  Brightness stateBarColor(BuildContext context) {
    return Store.value<ThemModel>(context).getThemeModel()
        ? Brightness.dark
        : Brightness.light;
  }

  //主要文本颜色

  //分割线颜色
  Color lines(BuildContext context) {
    return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFFE5E5E5)
        : Color(0xFFE5E5E5);
  }
  //间隔线颜色
  Color spaceLinesColor(BuildContext context){
    return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFFEDEDED)
        : Color(0xFFEDEDED);
  }

  //cell的背景色
  Color cellBgColor(BuildContext context){
    return Store.value<ThemModel>(context).getThemeModel()
        ? Colors.white
        : Colors.white;
  }

  //正常模式下灰色字体

  Color fontColor(BuildContext context){
     return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFFB2B2B2)
        : Color(0xFFB2B2B2);
  }

//首页子标题颜色
Color subtitleColor(BuildContext context){
return Store.value<ThemModel>(context).getThemeModel()
        ? Color(0xFF9b9b9b)
        : Color(0xFF9b9b9b);
}


}
