import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wechat_flutter/state/provider_store.dart';
import 'package:wechat_flutter/state/them_model.dart';
import 'package:wechat_flutter/unitls/them_util.dart';

class NavBarConfig {
  //默认导航栏样式
  AppBar configAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
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
  AppBar tabbarAppBar(String title, BuildContext context,
      {Function rightAction}) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      leading: Text(''),
      actions: [wechatRightButton(title, rightAction: rightAction)],
      backgroundColor: ThemUntil().tabbarColor(context),
      elevation: 0, //阴影辐射范围
      brightness: ThemUntil().stateBarColor(context),
    );
  }

  //wechat right button
  Widget wechatRightButton(String title, {Function rightAction}) {
    if (title.contains('微信')) {
      return Container(
        padding: EdgeInsets.only(right: 10),
        child: IconButton(
            icon: SvgPicture.asset('images/mainframe/icons_outlined_add2.svg'),
            onPressed: rightAction),
      );
    }
    return Container();
  }
}
