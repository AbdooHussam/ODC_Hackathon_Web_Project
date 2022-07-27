import 'dart:convert';

class AdaptionModel {
  String? title;
  String? body;

  AdaptionModel({this.title, this.body});

  AdaptionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}