import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;


import '../core/resource/route_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> login({
  required String email,
    required String password,
    required BuildContext context
}) async{
    try{
      var response = await Dio().post( 'https://petology.orangedigitalcenteregypt.com/auth/login',
        data: {
          'email' :email,
          'password':password
        },
        options: Options(
          headers: {
            'Accept': "application/json",
            // 'Authorization': 'Bearer  $token',
          },
        ),
      ).then((value) {
        print(value.data);
        GoRouter.of(context).replace('/HomeScreen')  ;
      });
    } on DioError catch(e){
      Fluttertoast.showToast(
          msg: e.response!.data['error']['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          webBgColor: "#F44336FF",
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e.response!.data);
    }


  }

  Future<void> loginFaceBook({

    required BuildContext context
  }) async{

  //   try{
  //
  //     var response = await Dio().get('https://petology.orangedigitalcenteregypt.com/auth/oauth2/facebook',
  //       options: Options(
  //         headers: {
  //           'Accept': "application/json",
  //           // 'Authorization': 'Bearer  $token',
  //         },
  //       ),
  //     ).then((value) {
  //       if (kDebugMode)
  //       {
  //         print(     value.statusMessage);
  //         // /
  //       }
  //
  //     });
  //   } on DioError catch(e){
  //     print('Amr');
  //     print(e.response!.data);
  //
  //
  //
  //   }
  //
  //
  }
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String county,
    required BuildContext context
  }) async{
    try{
      var response = await Dio().post('https://petology.orangedigitalcenteregypt.com/auth/register',
        data: {
          'email' :email,
          'password':password,
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber":'010010',
          "country": county
        },
        options: Options(
          headers: {
            'Accept': "application/json",
            // 'Authorization': 'Bearer  $token',
          },
        ),
      ).then((value) {
        print(value.data);
        GoRouter.of(context).replace('/HomeScreen')  ;
      });
    } on DioError catch(e){
      Fluttertoast.showToast(
          msg: e.response!.data['error']['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          webBgColor: "#F44336FF",
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e.response!.data);
    }


  }

}
