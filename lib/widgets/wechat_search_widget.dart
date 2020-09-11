import 'package:flutter/material.dart';
import 'package:wechat_flutter/unitls/global.dart';
import 'package:wechat_flutter/unitls/them_util.dart';

class WechatSearchWidget extends StatefulWidget {
  @override
  _WechatSearchWidgetState createState() => _WechatSearchWidgetState();
}

class _WechatSearchWidgetState extends State<WechatSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 56,
        width: Global.ksWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ThemUntil().navColor(context),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ThemUntil().cellBgColor(context)
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 17,
                  height: 17,
                  child: Image.asset(
                      'images/search/fts_searchicon_magnifier_16x16.png')),
              Text(
                "搜索",
                style: TextStyle(color: Color(0xff8e8e92), fontSize: 17),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print('object');
      },
    );
  }
}
