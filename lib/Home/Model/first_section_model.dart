// To parse this JSON data, do
//
//     final firstSectionModel = firstSectionModelFromJson(jsonString);

import 'dart:convert';

FirstSectionModel firstSectionModelFromJson(String str) => FirstSectionModel.fromJson(json.decode(str));

String firstSectionModelToJson(FirstSectionModel data) => json.encode(data.toJson());

class FirstSectionModel {
  FirstSectionModel({
    this.title,
    this.body,
  });

  String? title;
  String? body;

  factory FirstSectionModel.fromJson(Map<String, dynamic> json) => FirstSectionModel(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
