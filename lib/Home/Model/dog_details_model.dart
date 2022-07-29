class dogDetails{
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

dogDetails({this.id, this.name, this.image, this.year, this.month, this.size, this.breed, this.gender, this.hairLength, this.color, this.careBehavior, this.houseTrained, this.description, this.location, this.phone, this.vaccinated, this.categoryId, this.userId, this.category, this.user});

dogDetails.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
image = json['image'].cast<String>();
year = json['year'];
month = json['month'];
size = json['size'];
breed = json['breed'];
gender = json['gender'];
hairLength = json['hairLength'];
color = json['color'];
careBehavior = json['careBehavior'];
houseTrained = json['houseTrained'];
description = json['description'];
location = json['location'];
phone = json['phone'];
vaccinated = json['vaccinated'];
categoryId = json['categoryId'];
userId = json['userId'];
category = json['category'];
user = json['user'] != null ? new User.fromJson(json['user']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['image'] = this.image;
  data['year'] = this.year;
  data['month'] = this.month;
  data['size'] = this.size;
  data['breed'] = this.breed;
  data['gender'] = this.gender;
  data['hairLength'] = this.hairLength;
  data['color'] = this.color;
  data['careBehavior'] = this.careBehavior;
  data['houseTrained'] = this.houseTrained;
  data['description'] = this.description;
  data['location'] = this.location;
  data['phone'] = this.phone;
  data['vaccinated'] = this.vaccinated;
  data['categoryId'] = this.categoryId;
  data['userId'] = this.userId;
  data['category'] = this.category;
  if (this.user != null) {
    data['user'] = this.user!.toJson();
  }
  return data;
}
}

class User {
  String? firstName;
  String? lastName;

  User({this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}
