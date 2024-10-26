import 'dart:convert';

Arg argFromJson(String str) => Arg.fromJson(json.decode(str));
String argToJson(Arg data) => json.encode(data.toJson());
class Arg {
  Arg({
      this.id,});

  Arg.fromJson(dynamic json) {
    id = json['id'];
  }
  dynamic id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}