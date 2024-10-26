import 'arg.dart';
import 'dart:convert';

NavigationDetailsModel navigationDetailsModelFromJson(String str) => NavigationDetailsModel.fromJson(json.decode(str));
String navigationDetailsModelToJson(NavigationDetailsModel navigationDetailsModel) => json.encode(navigationDetailsModel.toJson());

class NavigationDetailsModel {
  NavigationDetailsModel({
    this.androidChannelId,
    this.title,
    this.screen,
    this.body,
    this.page,
    this.bigImage,
    this.image,
    this.time,
    this.description,
    this.date,
    this.arg,
    this.orderStatus,
    this.orderId,
    this.id,
  });

  NavigationDetailsModel.fromJson(dynamic json) {
    androidChannelId = json['android_channel_id'];
    title = json['title'];
    body = json['body'];
    page = json['page'];
    bigImage = json['bigImage'];
    image = json['image'];
    orderStatus = json['order_status'];
    orderId = json['order_id'];
    date = json['date'];
    description = json['description'];
    time = json['time'];
    id = json['id'];
    screen = json['screen'];
    // arg = json['arg'] != null ? Arg.fromJson(json['arg']) : null;
  }

  String? androidChannelId;
  String? title;
  String? body;
  String? page;
  String? bigImage;
  String? image;
  String? orderStatus;
  String? orderId;
  String? date;
  String? screen;
  String? time;
  dynamic id;
  String? description;
  Arg? arg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['android_channel_id'] = androidChannelId;
    map['title'] = title;
    map['body'] = body;
    map['page'] = page;
    map['bigImage'] = bigImage;
    map['image'] = image;
    map['order_status'] = orderStatus;
    map['order_id'] = orderId;
    map['date'] = date;
    map['description'] = description;
    map['time'] = time;
    map['id'] = id;
    map['screen'] = screen;
    if (arg != null) {
      map['arg'] = arg?.toJson();
    }
    return map;
  }

  NavigationDetailsModel copyWith({


   String? androidChannelId,
    String? title,
    String? body,
    String? page,
    String? bigImage,
    String? image,
    String? screen,
    String? time,
    String? description,
    String? date,
    Arg? arg,
    dynamic id,
    String? orderStatus,
    String? orderId,
  }) {
    return NavigationDetailsModel(
      androidChannelId: androidChannelId ?? this.androidChannelId,
      title: title ?? this.title,
      body: body ?? this.body,
      page: page ?? this.page,
      bigImage: bigImage ?? this.bigImage,
      image: image ?? this.image,
      time: time ?? this.time,
      description: description ?? this.description,
      date: date ?? this.date,
      screen: screen ?? this.screen,
      arg: arg ?? this.arg,
      id: id ?? this.id,
      orderStatus: orderStatus ?? this.orderStatus,
      orderId: orderId ?? this.orderId,
    );
  }
}
