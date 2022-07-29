import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../Home/Model/all_pets_model.dart';
import '../Model/filter_control_model.dart';

class RemoteServicesFilter {
// year%22%3A%201%2C%0A%22size%22%3A%20%22small%22%2C%0A%22


//   static Future<List<AllPetsModel>> getAllPetsFilterCategory(
//       {String? year,
//       String? size,
//       String? breed,
//       String? gender,
//       String? hairLength,
//       String? color,
//       String? careBehavior,
//       String? categoryId}) async {
//     String year2;
//     String size2;
//     String breed2;
//     String gender2;
//     String hairLength2;
//     String color2;
//     String careBehavior2;
//     String categoryId2;
//     if (year == null) {
//       year2 = "";
//     } else {
//       year2 = "year%22%3A%20$year%2C%0A%22";
//     }
//     if (size == null) {
//       size2 = "";
//     } else {
//       size2 = "size%22%3A%20%22$size%22%2C%0A%22";
//     }
//     if (breed == null) {
//       breed2 = "";
//     } else {
//       breed2 = "breed%22%3A%20%22$breed%22%2C%0A%22";
//     }
//     if (gender == null) {
//       gender2 = "";
//     } else {
//       gender2 = "gender%22%3A%20$gender%2C%0A%22";
//     }
//     if (hairLength == null) {
//       hairLength2 = "";
//     } else {
//       hairLength2 = "hairLength%22%3A%20%22$hairLength%22%2C%0A%22";
//     }
//     if (color == null) {
//       color2 = "";
//     } else {
//       color2 = "color%22%3A%20%22Antique%20$color%22%2C%0A%22";
//     }
//     if (careBehavior == null) {
//       careBehavior2 = "";
//     } else {
//       careBehavior2 = "careBehavior%22%3A%20%22$careBehavior%22%2C%0A%22";
//     }
//     if (categoryId == null) {
//       categoryId2 = "";
//     } else {
//       categoryId2 = "categoryId%22%3A%20%22$categoryId%22%0A%7D";
//     }
//
//     http.Response response = await http.get(
//       Uri.parse(
//           "https://petology.orangedigitalcenteregypt.com/pets?filter=%7B%0A%22$year2$size2$breed2$gender2$hairLength2$color2$careBehavior2$categoryId2"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; char=UTF-8',
//       },
//     );
//     var body = response.body;
//     if (response.statusCode == 200) {
//       return allPetsFromJson(body);
//     } else {
//       throw Exception("Errrrrrooooorrr");
//     }
//   }
  static Future<FilterControlModel> getFilterControlModel(
      {required int categoryId}) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://petology.orangedigitalcenteregypt.com/pets/filters/$categoryId"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return filterControlModelFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }
}

// static Future<List<AllPetsModel>> getAllPetsFilterCategory(
//     {required int categoryId}) async {
//   var response = await Dio().post(
//     'https://petology.orangedigitalcenteregypt.com/categories/$categoryId/pets',
//     options: Options(
//       headers: {
//         'Content-Type': 'application/json; char=UTF-8',
//         // 'Authorization': 'Bearer $token',
//       },
//     ),
//   );
//   if (response.statusCode == 200) {
//     return allPetsFromJson(response.data);
//   } else {
//     throw Exception("Errrrrrooooorrr");
//   }
// }
