// To parse this JSON data, do
//
//     final footerSectionModel = footerSectionModelFromJson(jsonString);

import 'dart:convert';

FooterSectionModel footerSectionModelFromJson(String str) => FooterSectionModel.fromJson(json.decode(str));

String footerSectionModelToJson(FooterSectionModel data) => json.encode(data.toJson());

class FooterSectionModel {
  FooterSectionModel({
    this.email,
    this.location,
    this.phone,
    this.location2,
  });

  String? email;
  String? location;
  String? phone;
  String? location2;

  factory FooterSectionModel.fromJson(Map<String, dynamic> json) => FooterSectionModel(
    email: json["email"],
    location: json["location"],
    phone: json["phone"],
    location2: json["location2"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "location": location,
    "phone": phone,
    "location2": location2,
  };
}
