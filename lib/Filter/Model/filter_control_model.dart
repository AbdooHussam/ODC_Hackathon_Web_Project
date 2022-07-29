// To parse this JSON data, do
//
//     final filterControlModel = filterControlModelFromJson(jsonString);

import 'dart:convert';

FilterControlModel filterControlModelFromJson(String str) => FilterControlModel.fromJson(json.decode(str));

String filterControlModelToJson(FilterControlModel data) => json.encode(data.toJson());

class FilterControlModel {
  FilterControlModel({
    this.breed,
    this.ages,
    this.size,
    this.goodWith,
    this.gender,
    this.colors,
    this.hairLength,
    this.behaviour,
  });

  List<String>? breed;
  List<String>? ages;
  List<String>? size;
  List<String>? goodWith;
  Gender? gender;
  List<String>? colors;
  List<String>? hairLength;
  List<String>? behaviour;

  factory FilterControlModel.fromJson(Map<String, dynamic> json) => FilterControlModel(
    breed: List<String>.from(json["breed"].map((x) => x)),
    ages: List<String>.from(json["ages"].map((x) => x)),
    size: List<String>.from(json["size"].map((x) => x)),
    goodWith: List<String>.from(json["goodWith"].map((x) => x)),
    gender: Gender.fromJson(json["gender"]),
    colors: List<String>.from(json["colors"].map((x) => x)),
    hairLength: List<String>.from(json["hairLength"].map((x) => x)),
    behaviour: List<String>.from(json["behaviour"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "breed": List<dynamic>.from(breed!.map((x) => x)),
    "ages": List<dynamic>.from(ages!.map((x) => x)),
    "size": List<dynamic>.from(size!.map((x) => x)),
    "goodWith": List<dynamic>.from(goodWith!.map((x) => x)),
    "gender": gender!.toJson(),
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "hairLength": List<dynamic>.from(hairLength!.map((x) => x)),
    "behaviour": List<dynamic>.from(behaviour!.map((x) => x)),
  };
}

class Gender {
  Gender({
    this.male,
    this.female,
  });

  int? male;
  int? female;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    male: json["male"],
    female: json["female"],
  );

  Map<String, dynamic> toJson() => {
    "male": male,
    "female": female,
  };
}
