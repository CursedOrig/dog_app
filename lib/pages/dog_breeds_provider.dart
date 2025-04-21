import 'package:dogapp/Models/breed_model.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';
import '../services/dog_api_client.dart';

class DogBreedsProvider extends ChangeNotifier {
  final List<BreedModel> breeds = [];
  bool get noData => breeds.isEmpty;

  Future<void> fetchBreeds() async {
    await Future.delayed(const Duration(seconds: 1));
    final isConnected = await NetworkService.isConnected;
    if (!isConnected) return;

    breeds.clear();

    try {
      final result = await DogApiClient.fetchDogBreeds();
      if (result == null) {
        throw Exception('Bad result exception');
      }
      breeds.addAll(result);
      notifyListeners();
    } catch (e) {
      // TODO data fetch error
      notifyListeners();
    }
  }
}
