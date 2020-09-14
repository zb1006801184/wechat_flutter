import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/wechat_search_widget.dart';
import '../../model/message_model.dart';
import '../../widgets/wechat_item_widget.dart';
class Wechat extends StatefulWidget {
  @override
  _WechatState createState() => _WechatState();
}

class _WechatState extends State<Wechat> {
  List _dataSource = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestData();
  }

  _requestData() async {
    await rootBundle.loadString('mock/mainframe.json').then((jsonStr) {
      final List mainframeJson = json.decode(jsonStr);
      mainframeJson.forEach((json) {
        final MessageModel model = MessageModel.fromJson(json);
        _dataSource.add(model);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: WechatSearchWidget(),
        ),
        SliverFixedExtentList(
            delegate:
                SliverChildBuilderDelegate(_buildChatCellWidget, childCount: _dataSource?.length),
            itemExtent: 72.0)
      ],
    );
  }

  Widget _buildChatCellWidget(BuildContext context, int index) {
    return WechatItemWidget(model: _dataSource[index],);
  }
}
