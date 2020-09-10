import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wechat_flutter/unitls/global.dart';
import 'package:wechat_flutter/unitls/them_util.dart';
import 'package:wechat_flutter/widgets/commont_item_widget.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  _cellClick({String title}) {
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Global.ksHeight,
      width: Global.ksWidth,
      child: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true, context: context, child: mainContent()),
          positiondedButton(),
        ],
      ),
    );
  }

  //main content
  Widget mainContent() {
    return ListView(
      children: [
        buildTopMessageWidget(),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '支付',
          iconString: 'profile/icons_outlined_wechatpay.svg',
          cellClickFunciton: _cellClick,
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '收藏',
          iconString: 'profile/icons_outlined_colorful_favorites.svg',
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '相册',
          iconString: 'profile/icons_outlined_album.svg',
          iconColor: Color(0xFF3d83e6),
          isShowTopLine: false,
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '卡包',
          iconString: 'profile/icons_outlined_colorful_cards.svg',
          isShowTopLine: false,
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
        ),
        CommontItemWidget(
          title: '表情',
          iconString: 'profile/icons_outlined_sticker.svg',
          isShowTopLine: false,
          bottomMargin: EdgeInsets.only(left: 56),
          cellClickFunciton: _cellClick,
          iconColor: Color(0xFFf6c534),
        ),
        buildSpaceLineWidget(),
        CommontItemWidget(
          title: '设置',
          iconString: 'profile/icons_outlined_setting.svg',
          iconColor: Color(0xFF3d83e6),
          cellClickFunciton: _cellClick,
        ),
      ],
    );
  }

  //Positioned button
  Widget positiondedButton() {
    return Positioned(
        top: 34,
        right: 22,
        child: IconButton(
            icon: SvgPicture.asset('images/moments/icons_filled_camera.svg'),
            onPressed: () {
              print('object');
            }));
  }

  Widget buildSpaceLineWidget({double height = 9}) {
    return Container(
      height: height,
      width: Global.ksWidth,
      color: ThemUntil().spaceLinesColor(context),
    );
  }

  //top message widget
  Widget buildTopMessageWidget() {
    return Container(
        height: 200,
        width: Global.ksWidth,
        padding: EdgeInsets.only(bottom: 44, left: 24),
        color: ThemUntil().cellBgColor(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/moments/kris_wu.png')),
                      borderRadius: BorderRadius.circular(8)),
                ),
                Expanded(child: _buildColumWidget())
              ],
            )
          ],
        ));
  }

  Widget _buildColumWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 22, top: 5),
          child: Text(
            'Zzzz',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 22, top: 7, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '微信号：zb1006801184',
                    // maxLines: 1,
                    style: TextStyle(color: ThemUntil().fontColor(context)),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                            'images/profile/setting_myQR_36x36.png'),
                      ),
                      Container(
                        width: 8,
                        height: 13,
                        margin: EdgeInsets.only(left: 24),
                        child: Image.asset(
                            'images/arrow/tableview_arrow_8x13.png'),
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
