import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class ContactInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;

  Color bgColor;
  IconData iconData;

  String img;
  String id;
  String firstletter;

  String screenName;
  String idstr;
  String profileImageUrl;
  String wechatId;
  String featureSign;
  int gender;
  List<String> phones;
  List<Pictures> pictures;
  String remarks;

  ContactInfo(
      {this.name,
      this.tagIndex,
      this.namePinyin,
      this.bgColor,
      this.iconData,
      this.img,
      this.id,
      this.firstletter,
      this.screenName,
      this.idstr,
      this.profileImageUrl,
      this.wechatId,
      this.featureSign,
      this.gender,
      this.phones,
      this.pictures,
      this.remarks});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    id = json['id']?.toString();
    firstletter = json['firstletter'];
    screenName = json['screen_name'];
    idstr = json['idstr'];
    profileImageUrl = json['profile_image_url'];
    wechatId = json['wechatId'];
    featureSign = json['featureSign'];
    gender = json['gender'];
    // phones = json['phones'].cast<String>();
    if (json['pictures'] != null) {
      pictures = new List<Pictures>();
      json['pictures'].forEach((v) {
        pictures.add(new Pictures.fromJson(v));
      });
    }
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() => {
//        'id': id,
        'name': name,
        'img': img,
//        'firstletter': firstletter,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}

class Pictures {
  String name;
  Small small;
  Small big;

  Pictures({this.name, this.small, this.big});

  Pictures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    big = json['big'] != null ? new Small.fromJson(json['big']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.big != null) {
      data['big'] = this.big.toJson();
    }
    return data;
  }
}

class Small {
  String url;

  Small({this.url});

  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
