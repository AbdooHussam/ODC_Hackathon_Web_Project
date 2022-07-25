import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Model/all_pets.dart';
import '../service/service_home1.dart';

part 'home1_state.dart';

class Home1Cubit extends Cubit<Home1State> {
  Home1Cubit() : super(Home1Initial());

  static Home1Cubit get(context) => BlocProvider.of(context);

  List<AllPets> allPetsList = [];

  Future<void> fetchAllPets() async {
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
      emit(Success());
    }
  }
}
