import 'dart:convert';
import 'package:dogapp/Models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogBreedsProvider extends ChangeNotifier {
  final List<BreedModel> breeds = [];

  Future<void> fetchBreeds() async {
    breeds.clear();
    // try {

    // await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> breedsMap = data['message'];

      final result = breedsMap.entries.map((mapEntry) {
        return BreedModel(
          breed: mapEntry.key,
          subBreeds: (mapEntry.value as List<dynamic>).map<String>((d) => d.toString()).toList(),
        );
      }).toList();
      breeds.addAll(result);
      notifyListeners();
    } else {
      // breeds = ['Server error'];
      notifyListeners();
    }
    // } catch (e) {
    // breeds = ['No internet'];
    notifyListeners();
    // }
  }
}
