import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../Home/Model/all_pets_model.dart';
import '../Model/filter_control_model.dart';
import '../service/service_filter.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context) => BlocProvider.of(context);

  String? ageValue;
  String? monthValue ;
  String? sizeValue ;
  String? hairLenghtValue;
  String? breedValue ;
  String? colorValue ;
  String? behaviourValue ;


  List<AllPetsModel> allPetsCategoryFilterList = [];
  FilterControlModel filterControl = FilterControlModel(
      size: [],
      ages: [],
      behaviour: [],
      breed: [],
      colors: [],
      gender: Gender(female: 1, male: 0),
      goodWith: [],
      hairLength: []);

  Future<void> getAllPetsFilterCategory(
      {String? age,
      String? size,
      String? breed,
      String? gender,
      String? hairLength,
      String? color,
      String? careBehavior,
      String? categoryId}) async {
    String age2;
    String size2;
    String breed2;
    String gender2;
    String hairLength2;
    String color2;
    String careBehavior2;
    String categoryId2;
    if (age == null) {
      age2 = "";
    } else {
      age2 = "year%22%3A%20$age%2C%0A%22";
    }
    if (size == null) {
      size2 = "";
    } else {
      size2 = "size%22%3A%20%22$size%22%2C%0A%22";
    }
    if (breed == null) {
      breed2 = "";
    } else {
      breed2 = "breed%22%3A%20%22$breed%22%2C%0A%22";
    }
    if (gender == null) {
      gender2 = "";
    } else {
      gender2 = "gender%22%3A%20$gender%2C%0A%22";
    }
    if (hairLength == null) {
      hairLength2 = "";
    } else {
      hairLength2 = "hairLength%22%3A%20%22$hairLength%22%2C%0A%22";
    }
    if (color == null) {
      color2 = "";
    } else {
      color2 = "color%22%3A%20%22Antique%20$color%22%2C%0A%22";
    }
    if (careBehavior == null) {
      careBehavior2 = "";
    } else {
      careBehavior2 = "careBehavior%22%3A%20%22$careBehavior%22%2C%0A%22";
    }
    if (categoryId == null) {
      categoryId2 = "";
    } else {
      categoryId2 = "categoryId%22%3A%20%22$categoryId%22%0A%7D";
    }

    String url =
        "https://petology.orangedigitalcenteregypt.com/pets?filter=%7B%0A%22$age2$size2$breed2$gender2$hairLength2$color2$careBehavior2$categoryId2";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    print(url + "      hhhhhhhhhhhhhhhhhhhhhhh");
    var body = response.body;
    if (response.statusCode == 200) {
      allPetsCategoryFilterList = allPetsFromJson(body);
      try {
        if (allPetsCategoryFilterList != null) {
          for (int i = 0; i < allPetsCategoryFilterList.length; i++) {
            for (int x = 0;
                x < allPetsCategoryFilterList[i].image!.length;
                x++) {
              allPetsCategoryFilterList[i].image![x] =
                  allPetsCategoryFilterList[i]
                      .image![x]
                      .replaceAll("data:image/png;base64,", "");
            }
          }
        }
      } finally {
        emit(SuccessFilterCategory());
      }
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }

  // Future<void> getAllPetsFilter({required int categoryId}) async {
  //   try {
  //     var products = await RemoteServicesFilter.getAllPetsFilterCategory(
  //         categoryId: categoryId);
  //     if (products != null) {
  //       allPetsCategoryFilterList = products;
  //       for (int i = 0; i < allPetsCategoryFilterList.length; i++) {
  //         for (int x = 0; x < allPetsCategoryFilterList[i].image!.length; x++) {
  //           allPetsCategoryFilterList[i].image![x] =
  //               allPetsCategoryFilterList[i]
  //                   .image![x]
  //                   .replaceAll("data:image/png;base64,", "");
  //         }
  //       }
  //     }
  //   } finally {
  //     emit(SuccessFilterCategory());
  //   }
  // }

  Future<void> getFilterControlModel({required int categoryId}) async {
    try {
      var products = await RemoteServicesFilter.getFilterControlModel(
          categoryId: categoryId);
      if (products != null) {
        filterControl = products;
        filterControl.breed!.insert(0, "Breed");
        filterControl.ages!.insert(0, "Age");
        filterControl.size!.insert(0, "Size");
        filterControl.colors!.insert(0, "Color");
        filterControl.hairLength!.insert(0, "Hair Lenght");
        filterControl.behaviour!.insert(0, "Care & behavior");


        breedValue = filterControl.breed![0] ;
         ageValue = filterControl.ages![0];
         sizeValue = filterControl.size![0];
        colorValue = filterControl.colors![0] ;
         hairLenghtValue = filterControl.hairLength![0];
         behaviourValue = filterControl.behaviour![0] ;

      }
    } finally {
      emit(SuccessFilterControl());
    }
  }
}
