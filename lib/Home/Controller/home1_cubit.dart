import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../Model/all_pets_model.dart';
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
      var products = await RemoteServices.fetchAllPets();
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
      var products = await RemoteServices.fetchpetNeeds();
      if (products != null) {
        petNeedsList = products;
      }
    } finally {
      emit(SuccessPetNeeds());
    }
  }

  Future<void> getFirstSection() async {
    try {
      var products = await RemoteServices.fetchFirstSection();
      if (products != null) {
        firstSection = products;
      }
    } finally {
      emit(SuccessFirstSection());
    }
  }

  Future<void> getSecondSection() async {
    try {
      var products = await RemoteServices.fetchSecondSection();
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
            'Accept': "application/json",
            // 'Authorization': 'Bearer  $token',
          },
        ),
      ).then((value) {
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
}
