// To parse this JSON data, do
//
//     final allPets = allPetsFromJson(jsonString);

import 'dart:convert';

List<AllPetsModel> allPetsFromJson(String str) => List<AllPetsModel>.from(json.decode(str).map((x) => AllPetsModel.fromJson(x)));

String allPetsToJson(List<AllPetsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPetsModel {
  AllPetsModel({
    this.id,
    this.name,
    this.image,
    this.year,
    this.month,
    this.size,
    this.breed,
    this.gender,
    this.hairLength,
    this.color,
    this.careBehavior,
    this.houseTrained,
    this.description,
    this.location,
    this.phone,
    this.vaccinated,
    this.categoryId,
    this.userId,
    this.category,
    this.user,
  });

  int? id;
  String? name;
  List<String>? image;
  int? year;
  int? month;
  String? size;
  String? breed;
  bool? gender;
  String? hairLength;
  String? color;
  String? careBehavior;
  bool? houseTrained;
  String? description;
  String? location;
  String? phone;
  bool? vaccinated;
  int? categoryId;
  int? userId;
  String? category;
  User? user;

  factory AllPetsModel.fromJson(Map<String, dynamic> json) => AllPetsModel(
    id: json["id"],
    name: json["name"],
    image: List<String>.from(json["image"].map((x) => x)),
    year: json["year"],
    month: json["month"],
    size: json["size"],
    breed: json["breed"],
    gender: json["gender"],
    hairLength: json["hairLength"],
    color: json["color"],
    careBehavior: json["careBehavior"],
    houseTrained: json["houseTrained"],
    description: json["description"],
    location: json["location"],
    phone: json["phone"],
    vaccinated: json["vaccinated"],
    categoryId: json["categoryId"],
    userId: json["userId"],
    category: json["category"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": List<dynamic>.from(image!.map((x) => x)),
    "year": year,
    "month": month,
    "size": size,
    "breed": breed,
    "gender": gender,
    "hairLength": hairLength,
    "color": color,
    "careBehavior": careBehavior,
    "houseTrained": houseTrained,
    "description": description,
    "location": location,
    "phone": phone,
    "vaccinated": vaccinated,
    "categoryId": categoryId,
    "userId": userId,
    "category": category,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
  });

  String? firstName;
  String? lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };
}
