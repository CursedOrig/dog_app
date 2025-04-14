import 'dart:convert';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogImagesProvider extends ChangeNotifier {
  DogImagesProvider({this.subBreed, required this.breed});

  final String breed;
  final String? subBreed;
  final List<String> dogImages = [];
  bool get noData => dogImages.isEmpty;

  Future<void> fetchImages() async {
    final isConnected = await NetworkService.isConnected;
    if (!isConnected) return;

    dogImages.clear();

    try {
      final String targetBreed = subBreed == null ? breed : '$breed/$subBreed';
      final response =
          await http.get(Uri.parse('https://dog.ceo/api/breed/$targetBreed/images')); // TODO server bad response

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<String> images = (data['message'] as List<dynamic>).map((d) => d.toString()).toList();

        dogImages.addAll(images);
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
