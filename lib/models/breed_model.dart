class BreedModel {
  final String breed;
  final List<String> subBreeds;

  BreedModel({
    required this.breed,
    required this.subBreeds,
  });

  static List<BreedModel> fromJsonData(Map<String, dynamic> jsonData) {
    return jsonData.entries
        .map(
          (mapEntry) => BreedModel(
            breed: mapEntry.key,
            subBreeds: (mapEntry.value as List<dynamic>).map<String>((d) => d.toString()).toList(),
          ),
        )
        .toList();
  }
}
