// To parse this JSON data, do
//
//     final secondSectionModel = secondSectionModelFromJson(jsonString);

import 'dart:convert';

SecondSectionModel secondSectionModelFromJson(String str) => SecondSectionModel.fromJson(json.decode(str));

String secondSectionModelToJson(SecondSectionModel data) => json.encode(data.toJson());

class SecondSectionModel {
  SecondSectionModel({
    this.title,
    this.body,
  });

  String? title;
  String? body;

  factory SecondSectionModel.fromJson(Map<String, dynamic> json) => SecondSectionModel(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
