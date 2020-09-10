import 'package:flutter/material.dart';
import 'package:wechat_flutter/unitls/global.dart';
import 'package:wechat_flutter/unitls/them_util.dart';
import '../../widgets/commont_item_widget.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<Widget> items;
  _cellClick({String title}) {
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CommontItemWidget(
          title: '朋友圈',
          iconString: 'discover/icons_outlined_colorful_moment.svg',
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '扫一扫',
          iconString: 'discover/icons_outlined_scan.svg',
          iconColor: Color(0xFF3d83e6),
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '摇一摇',
          iconString: 'discover/icons_outlined_shake.svg',
          iconColor: Color(0xFF3d83e6),
          isShowTopLine: false,
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '看一看',
          iconString: 'discover/icons_outlined_news.svg',
          iconColor: Color(0xFFf6cb4a),
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '搜一搜',
          iconString: 'discover/ff_IconSearch1_25x25.png',
          isShowTopLine: false,
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '附近的人',
          iconString: 'discover/icons_outlined_nearby.svg',
          iconColor: Color(0xFF3d83e6),
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '购物',
          iconString: 'discover/icons_outlined_shop.svg',
          iconColor: Color(0xFFE75D58),
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '游戏',
          iconString: 'discover/icons_outlined_colorful_game.svg',
          isShowTopLine: false,
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '小程序',
          iconString: 'discover/icons_outlined_miniprogram.svg',
          iconColor: Color(0xFF6467E8),
          cellClickFunciton: _cellClick,
        ),
      ],
    );
  }

//line widget
  Widget buildSpaceLineWidget({double height = 9}) {
    return Container(
      height: height,
      width: Global.ksWidth,
      color: ThemUntil().spaceLinesColor(context),
    );
  }
}
