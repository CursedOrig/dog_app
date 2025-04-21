import 'dart:convert';
import 'package:dogapp/Models/breed_model.dart';
import 'package:http/http.dart' as http;

abstract class DogApiClient {
  static Future<List<BreedModel>?> fetchDogBreeds() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> breedsData = data['message'];
      final List<BreedModel> breeds = BreedModel.fromJsonData(breedsData);
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
