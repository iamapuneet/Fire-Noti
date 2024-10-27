import 'dart:convert';

NavigationDetailsModel navigationDetailsModelFromJson(String str) => NavigationDetailsModel.fromJson(json.decode(str));
String navigationDetailsModelToJson(NavigationDetailsModel data) => json.encode(data.toJson());
class NavigationDetailsModel {
  NavigationDetailsModel({
      this.to,
      this.data,});

  NavigationDetailsModel.fromJson(dynamic json) {
    to = json['to'];
    data = json['data'] != null ? NavigationDetailsModel.fromJson(json['data']) : null;
  }
  String? to;
  NavigationDetailsModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['to'] = to;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}