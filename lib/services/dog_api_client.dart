import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/breed_model.dart';

abstract class DogApiClient {
  static Future<List<BreedModel>?> fetchDogBreeds() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> breedsData = data['message'];

      final List<BreedModel> breeds = breedsData.entries.map((mapEntry) {
        return BreedModel(
          breed: mapEntry.key,
          subBreeds: (mapEntry.value as List<dynamic>).map<String>((d) => d.toString()).toList(),
        );
      }).toList();
      return breeds;
    } else {
      return null;
    }
  }

  static Future<List<String>?> fetchDogImages(String targetBreed) async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$targetBreed/images'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<String> images = (data['message'] as List<dynamic>).map((d) => d.toString()).toList();
      return images;
    } else {
      return null;
    }
  }
}
