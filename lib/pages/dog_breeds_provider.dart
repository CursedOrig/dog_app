import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogBreedsProvider extends ChangeNotifier {
  List<String> breeds = [];

  Future<void> fetchBreeds() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final Map<String, dynamic> breedMap = data['message'];

        breeds = breedMap.keys.toList();
        notifyListeners();
      } else {
        breeds = ['Server error'];
        notifyListeners();
      }
    } catch (e) {
      breeds = ['No internet'];
      notifyListeners();
    }
  }
}
