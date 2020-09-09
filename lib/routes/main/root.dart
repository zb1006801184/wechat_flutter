import 'package:flutter/material.dart';
import 'package:wechat_flutter/unitls/nav_bar_config.dart';
class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarConfig().configAppBar('联系人', context),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}