import 'package:flutter/material.dart';
import 'package:wechat_flutter/state/provider_store.dart';
import 'package:wechat_flutter/unitls/them_util.dart';
import './routes.dart';
import 'state/them_model.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      initialRoute: '/root',
      onGenerateRoute: onGenerateRoute,
      routes: routes,
      themeMode: Store.value<ThemModel>(context).getThemeModel()?ThemeMode.dark : ThemeMode
                    .light,
      darkTheme: ThemUntil().darktData,
      theme: ThemUntil().linghtData,
    );
  }
}
