import 'package:dogapp/core/exceptions.dart';
import 'package:dogapp/services/dog_api_client.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';

class DogImagesProvider extends ChangeNotifier {
  DogImagesProvider({this.subBreed, required this.breed});

  final String breed;
  final String? subBreed;
  final List<String> dogImages = [];
  bool get noData => dogImages.isEmpty;
  bool isError = false;

  Future<void> fetchImages() async {
    final isConnected = await NetworkService.isConnected;
    if (!isConnected) return;

    dogImages.clear();

    try {
      final String targetBreed = subBreed == null ? breed : '$breed/$subBreed';
      final result = await DogApiClient.fetchDogImages(targetBreed);
      if (result == null) {
        throw BadServerResultException();
      }
      dogImages.addAll(result);
      notifyListeners();
    } catch (e) {
      if (e is BadServerResultException) {
        isError = true;
      }
      notifyListeners();
    }
  }
}
