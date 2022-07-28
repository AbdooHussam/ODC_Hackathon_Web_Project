import 'package:http/http.dart' as http;

import '../Model/all_pets_model.dart';
import '../Model/first_section_model.dart';
import '../Model/footer_section_model.dart';
import '../Model/pet-needs_model.dart';
import '../Model/second_section_model.dart';

class RemoteServicesHome {
  // static var client = http.Client();

  static Future<List<AllPetsModel>> fetchAllPets() async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/pets"),
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

  static Future<List<PetNeedsModel>> fetchpetNeeds() async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/static/homepage/pet-needs"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return petNeedsFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }

  static Future<FirstSectionModel> fetchFirstSection() async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/static/homepage/first-section"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return firstSectionModelFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }

  static Future<SecondSectionModel> fetchSecondSection() async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/static/homepage/second-section"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return secondSectionModelFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }

  static Future<FooterSectionModel> fetchFooterSection() async {
    http.Response response = await http.get(
      Uri.parse("https://petology.orangedigitalcenteregypt.com/static/homepage/footer"),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
    );
    var body = response.body;
    if (response.statusCode == 200) {
      return footerSectionModelFromJson(body);
    } else {
      throw Exception("Errrrrrooooorrr");
    }
  }
}
