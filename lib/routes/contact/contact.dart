import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:wechat_flutter/model/contact_Info.dart';
import 'package:wechat_flutter/widgets/wechat_search_widget.dart';
import 'package:azlistview/azlistview.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<ContactInfo> contactList = List();
  List<ContactInfo> topList = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topList.add(ContactInfo(
      screenName: '搜索',
      tagIndex: '↑',
      // bgColor: Colors.orange,
      // iconData: Icons.person_add
    ));
    topList.add(ContactInfo(
        screenName: '新的朋友',
        tagIndex: '↑',
        bgColor: Colors.orange,
        iconData: Icons.person_add));
    topList.add(ContactInfo(
        screenName: '群聊',
        tagIndex: '↑',
        bgColor: Colors.green,
        iconData: Icons.people));
    topList.add(ContactInfo(
        screenName: '标签',
        tagIndex: '↑',
        bgColor: Colors.blue,
        iconData: Icons.local_offer));
    topList.add(ContactInfo(
        screenName: '公众号',
        tagIndex: '↑',
        bgColor: Colors.blueAccent,
        iconData: Icons.person));
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('mock/contacts1.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(contactList);
    }).catchError((e) {
      print(e);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].screenName);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add topList.
    contactList.insertAll(0, topList);

    setState(() {
      contactList = contactList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      data: contactList,
      itemCount: contactList.length,
      itemBuilder: (BuildContext context, int index) {
        ContactInfo model = contactList[index];
        if (model.screenName == '搜索') {
          return WechatSearchWidget();
        }
        return getWeChatListItem(
          context,
          model,
          defHeaderBgColor: Color(0xFFE5E5E5),
        );
      },
      physics: BouncingScrollPhysics(),
      susItemBuilder: (BuildContext context, int index) {
        //返回悬浮的视图
        ContactInfo model = contactList[index];
        if ('↑' == model.getSuspensionTag()) {
          return Container();
        }
        return getSusItem(context, model.getSuspensionTag());
      },
      indexBarData: ['↑', '☆', ...kIndexBarData],
      indexBarOptions: IndexBarOptions(
        needRebuild: true,
        ignoreDragCancel: true,
        downTextStyle: TextStyle(fontSize: 10, color: Colors.white),
        textStyle: TextStyle(fontSize: 10),
        downItemDecoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        indexHintWidth: 120 / 2,
        indexHintHeight: 100 / 2,
        indexHintDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/contacts/ic_index_bar_bubble_gray.png'),
            fit: BoxFit.contain,
          ),
        ),
        indexHintAlignment: Alignment.centerRight,
        indexHintChildAlignment: Alignment(-0.25, 0.0),
        indexHintOffset: Offset(-20, 0),
      ),
    );
  }

  static Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model, {
    double susHeight = 40,
    Color defHeaderBgColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Offstage(
          offstage: !(model.isShowSuspension == true),
          child: getSusItem(context, model.getSuspensionTag(),
              susHeight: susHeight),
        ),
        getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor),
      ],
    );
  }

  static Widget getWeChatItem(
    BuildContext context,
    ContactInfo model, {
    Color defHeaderBgColor,
  }) {
    DecorationImage image;
    return ListTile(
      leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
        child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? CachedNetworkImage(
                imageUrl: model?.profileImageUrl,
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      ),
      title: Text(model.screenName),
      onTap: () {
        //LogUtil.e("onItemClick : $model");
        // Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }

  //头部视图
  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}
