import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../Home/Model/all_pets_model.dart';

class RemoteServicesFilter {

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


  static Future<List<AllPetsModel>> getAllPetsFilterCategory({required int categoryId}) async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/categories/$categoryId/pets"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return allPetsFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }

}
