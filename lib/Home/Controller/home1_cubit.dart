import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:odc_hackathon_web_project/dog_details/view/dog_detiles_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/all_pets_model.dart';
import '../Model/dog_details_model.dart';
import '../Model/first_section_model.dart';
import '../Model/footer_section_model.dart';
import '../Model/pet-needs_model.dart';
import '../Model/second_section_model.dart';
import '../service/service_home1.dart';

part 'home1_state.dart';

class Home1Cubit extends Cubit<Home1State> {
  Home1Cubit() : super(Home1Initial());

  static Home1Cubit get(context) => BlocProvider.of(context);

  List<AllPetsModel> allPetsList = [];
  List<PetNeedsModel> petNeedsList = [];
  FirstSectionModel firstSection = FirstSectionModel(body: "", title: "");
  SecondSectionModel secondSection = SecondSectionModel(body: "", title: "");

  Future<void> getAllPets() async {
    try {
      var products = await RemoteServicesHome.fetchAllPets();
      if (products != null) {
        allPetsList = products;
        for (int i = 0; i < allPetsList.length; i++) {
          for (int x = 0; x < allPetsList[i].image!.length; x++) {
            allPetsList[i].image![x] = allPetsList[i]
                .image![x]
                .replaceAll("data:image/png;base64,", "");
          }
        }
      }
    } finally {
      emit(SuccessAnimal());
    }
  }

  Future<void> getPetNeeds() async {
    try {
      var products = await RemoteServicesHome.fetchpetNeeds();
      if (products != null) {
        petNeedsList = products;
      }
    } finally {
      emit(SuccessPetNeeds());
    }
  }

  Future<void> getFirstSection() async {
    try {
      var products = await RemoteServicesHome.fetchFirstSection();
      if (products != null) {
        firstSection = products;
      }
    } finally {
      emit(SuccessFirstSection());
    }
  }

  Future<void> getSecondSection() async {
    try {
      var products = await RemoteServicesHome.fetchSecondSection();
      if (products != null) {
        secondSection = products;
      }
    } finally {
      emit(SuccessSecondSection());
    }
  }

  Future<void> postPets({
    required int categoryId,
    required String imageBase64,
    required String location,
    required String phoneNumber,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token;
      token = prefs.getString("accessToken");
      print("$token  llllllllllllllllllllllllllll");
      var response = await Dio()
          .post(
        'https://petology.orangedigitalcenteregypt.com/pets/request',
        data: {
          "categoryId": categoryId,
          "imageBase64": imageBase64,
          "location": location,
          "phoneNumber": phoneNumber,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; char=UTF-8',
            'Authorization': 'Bearer $token',
          },
        ),
      )
          .then((value) {
        Fluttertoast.showToast(
            msg: value.data['message'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            webBgColor: "#F44336FF",
            textColor: Colors.white,
            fontSize: 16.0);
        print(value.data);
      });
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['error']['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          webBgColor: "#F44336FF",
          textColor: Colors.white,
          fontSize: 16.0);
      print(e.response!.data);
    }
  }

  Future<void> postRequest({
    required String name,
    required List<String> image,
    required int year,
    required int month,
    required String size,
    required String breed,
    required bool gender,
    required String hairLength,
    required String color,
    required String careBehavior,
    required bool houseTrained,
    required String description,
    required String location,
    required String phone,
    required bool vaccinated,
    required int categoryId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token;
      token = prefs.getString("accessToken");
      print("$token  llllllllllllllllllllllllllll");
      var response = await Dio()
          .post(
        'https://petology.orangedigitalcenteregypt.com/pets',
        data: {
          "pet": {
            "name": name,
            "image": image,
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
            "categoryId": categoryId
          }
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; char=UTF-8',
            'Authorization': 'Bearer $token',
          },
        ),
      )
          .then((value) {
        Fluttertoast.showToast(
            msg: (value.data['name'].toString().isEmpty)
                ? value.data['message'].toString()
                : "succeeded",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            webBgColor: "#F44336FF",
            textColor: Colors.white,
            fontSize: 16.0);
        print(value.data);
      });
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['error']['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          webBgColor: "#F44336FF",
          textColor: Colors.white,
          fontSize: 16.0);
      print(e.response!.data);
    }
  }
  dogDetails ? details ;
  Future<void> getDogDetails({ required String id ,required BuildContext context}) async{
    try{
      await Dio().get('https://petology.orangedigitalcenteregypt.com/pets/$id', ).then((value) {
        details = dogDetails.fromJson(value.data);
       Navigator.push(context,
           MaterialPageRoute(builder: (context)=>
       DogDetails(details: details,)
       ));
        print(details!.size);
        // print(value.data);
      });
    } on DioError catch(dataError)
    {
      print(dataError);
    }
  }

}
