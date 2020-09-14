import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/model/message_model.dart';
import 'package:wechat_flutter/unitls/them_util.dart';

class WechatItemWidget extends StatefulWidget {
//消息数据
  MessageModel model;

  WechatItemWidget({this.model});

  @override
  _WechatItemWidgetState createState() => _WechatItemWidgetState();
}

class _WechatItemWidgetState extends State<WechatItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          color: ThemUntil().cellBgColor(context),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, right: 8),
                width: 48,
                height: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _requestImage(),
                ),
              ),
              Expanded(child: _buildExpandedView())
            ],
          )),
      onTap: () {
        print('object');
      },
    );
  }

//本地图片或者网络图片
  Widget _requestImage() {
    Users user = widget.model.users[0];
    if (widget.model.type == '1') {
      return CachedNetworkImage(
        imageUrl: user?.profileImageUrl,
        // placeholder: (context, url) =>
        //     Image.asset('images/placeholder_img.png'),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else {
      return Image.asset(
        user?.profileImageUrl,
        fit: BoxFit.cover,
      );
    }
  }

  //Expanded View

  Widget _buildExpandedView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Text(
                widget.model.screenName ?? '无名',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 14),
              child: Text(
                '09-11',
                style: TextStyle(
                    color: ThemUntil().fontColor(context), fontSize: 12),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 16, top: 3),
          child: Text(
            widget.model.text ?? '',
            style: TextStyle(color: ThemUntil().subtitleColor(context)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
