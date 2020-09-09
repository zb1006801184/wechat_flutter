import 'package:flutter/material.dart';
import 'package:wechat_flutter/state/provider_store.dart';
import 'package:wechat_flutter/state/them_model.dart';
import 'package:wechat_flutter/unitls/them_util.dart';

class NavBarConfig {
  //默认导航栏样式
  AppBar configAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle( fontSize: 18),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Store.value<ThemModel>(context).getThemeModel()
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      backgroundColor: ThemUntil().tabbarColor(context),
      elevation: 0, //阴影辐射范围
      brightness: ThemUntil().stateBarColor(context),
    );
  }

  //一级路由的导航栏
  AppBar tabbarAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle( fontSize: 18),
      ),
      leading: Text(''),
      backgroundColor: ThemUntil().tabbarColor(context),
      elevation: 0, //阴影辐射范围
      brightness: ThemUntil().stateBarColor(context),
    );
  }


  
}
