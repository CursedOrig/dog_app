import 'dart:convert';
import 'package:dogapp/Models/breed_model.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogBreedsProvider extends ChangeNotifier {
  final List<BreedModel> breeds = [];
  bool get noData => breeds.isEmpty;

  Future<void> fetchBreeds() async {
    final isConnected = await NetworkService.isConnected;
    if (!isConnected) return;

    breeds.clear();

    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all')); // TODO server bad response

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
        // TODO server bad response
        notifyListeners();
      }
    } catch (e) {
      // TODO data fetch error
      notifyListeners();
    }
  }
}
