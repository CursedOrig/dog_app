import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogImagesProvider extends ChangeNotifier {
  DogImagesProvider({this.subBreed,required this.breed});

  final String breed;
  final String? subBreed;
  final List<String> dogImages = [];

  Future<void> fetchImages() async {
    dogImages.clear();
    // try { // TODO error catching

    // await Future.delayed(Duration(seconds: 2));
    final String targetBreed = subBreed == null ? breed : '$breed/$subBreed';
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$targetBreed/images'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<String> images = (data['message'] as List<dynamic>).map((d) => d.toString()).toList();

      dogImages.addAll(images);
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
