import 'package:http/http.dart' as http;

import '../Model/all_pets.dart';

class RemoteServices {
  // static var client = http.Client();

  static Future<List<AllPets>> fetchAllPets() async {
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
}
