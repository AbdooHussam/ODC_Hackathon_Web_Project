// To parse this JSON data, do
//
//     final petNeeds = petNeedsFromJson(jsonString);

import 'dart:convert';

List<PetNeedsModel> petNeedsFromJson(String str) => List<PetNeedsModel>.from(json.decode(str).map((x) => PetNeedsModel.fromJson(x)));

String petNeedsToJson(List<PetNeedsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetNeedsModel {
  PetNeedsModel({
    this.imageUrl,
    this.title,
  });

  String? imageUrl;
  String? title;

  factory PetNeedsModel.fromJson(Map<String, dynamic> json) => PetNeedsModel(
    imageUrl: json["imageUrl"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "title": title,
  };
}
