import 'package:dogapp/Models/breed_model.dart';
import 'package:dogapp/core/exceptions.dart';
import 'package:dogapp/services/dog_api_client.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:flutter/material.dart';

class DogBreedsProvider extends ChangeNotifier {
  final List<BreedModel> breeds = [];
  bool get noData => breeds.isEmpty;
  bool isError = false;

  Future<void> fetchBreeds() async {
    await Future.delayed(const Duration(seconds: 1));
    final isConnected = await NetworkService.isConnected;
    if (!isConnected) return;

    breeds.clear();

    try {
      final result = await DogApiClient.fetchDogBreeds();
      if (result == null) {
        throw BadServerResultException();
      }
      breeds.addAll(result);
      notifyListeners();
    } catch (e) {
      if (e is BadServerResultException) {
        isError = true;
      }
      notifyListeners();
    }
  }
}
