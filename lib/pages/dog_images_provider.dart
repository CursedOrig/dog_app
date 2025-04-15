import 'package:dogapp/services/dog_api_client.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';

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
      final result = await DogApiClient.fetchDogImages(targetBreed);
      if (result == null) {
       throw Exception('Bad result exception');
      }
      dogImages.addAll(result);
      notifyListeners();
    } catch (e) {
      // TODO data fetch error
      notifyListeners();
    }
  }
}
