import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'end_point.dart';

class DioHelper {
  static late Dio dio;
  DioHelper(String api){
    dio = Dio();
    dio.options.receiveDataWhenStatusError = true;
    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout = 10000;
    dio.options.baseUrl = api;
  }
  static Future<Response?> postData(
      {String ?endPoint, Map <String,dynamic>?dataPost, String token = ''}) async {

    try{
      Response response = await dio.post(
        KEY+endPoint!,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer  $token',
          },

        ),
        data: dataPost
    );
      return response;
    }on DioError catch(e){
      return e.response;
    }


  }
  static Future<Response?> getData(
      {String ?endPoint, Map <String,dynamic>?query, String token = ''}) async {
    try{
    Response response = await dio.get(
        KEY+endPoint!,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer  $token',
          },

        ),
        queryParameters: query
    );
    return response;
  }on DioError catch(e)
    {
      return e.response;
    }
  }




}