import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wechat_flutter/unitls/global.dart';
import 'package:wechat_flutter/unitls/them_util.dart';

class CommontItemWidget extends StatefulWidget {
  //标题
  String title;
  //左侧图标
  String iconString;
  //是否显示右侧arrow图标
  bool isShowArrowIcon;
  //底部分割线外边距
  EdgeInsetsGeometry bottomMargin;
  //是否显示顶部分割线
  bool isShowTopLine;
  //icon颜色
  Color iconColor;
  //item 的点击事件
  Function cellClickFunciton;

  CommontItemWidget({
    this.title,
    this.iconString,
    this.isShowArrowIcon,
    this.bottomMargin,
    this.isShowTopLine,
    this.iconColor,
    this.cellClickFunciton,
  });

  @override
  _CommontItemWidgetState createState() => _CommontItemWidgetState();
}

class _CommontItemWidgetState extends State<CommontItemWidget> {
  @override
  Widget build(BuildContext context) {
    Widget iconImageWidget() {
      if (widget.title == '搜一搜') {
        return Image.asset(
          'images/' + widget.iconString,
          color: widget.iconColor,
        );
      }
      return SvgPicture.asset(
        'images/' + widget.iconString,
        color: widget.iconColor,
      );
    }

    return InkWell(
      child: Container(
          height: 56,
          width: Global.ksWidth,
          color: ThemUntil().cellBgColor(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //top line
              widget.isShowTopLine ?? true ? buildLineWidget() : Container(),
              //center content
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            width: 21,
                            height: 21,
                            margin: EdgeInsets.only(left: 18),
                            child: iconImageWidget()),
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Text(
                            widget.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 18),
                    child: Image.asset(
                      'images/arrow/tableview_arrow_8x13.png',
                      width: 8,
                      height: 13,
                    ),
                  ),
                ],
              ),
              //bottom line
              buildLineWidget(marigin: widget.bottomMargin),
            ],
          )),
      onTap: () {
        if (widget.cellClickFunciton != null)
          widget.cellClickFunciton(title: widget.title);
      },
    );
  }

  //line widget
  Widget buildLineWidget({EdgeInsetsGeometry marigin}) {
    return Container(
      height: 0.5,
      width: Global.ksWidth,
      margin: marigin ?? EdgeInsets.all(0),
      color: ThemUntil().lines(context),
    );
  }
}
