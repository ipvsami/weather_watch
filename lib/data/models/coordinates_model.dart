class CoordinatesModel {
  String? name;
  double? latitude;
  double? longitude;
  String? country;

  CoordinatesModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.country,
  });

  static List<CoordinatesModel> fromJson(json) {
    List<Map<String, dynamic>> results = json['results'] ?? [];
    List<CoordinatesModel> coordinates = [];
    results.isNotEmpty
        ? coordinates = List.generate(
            results.length,
            (index) {
              return CoordinatesModel(
                name: results[index]['name'],
                latitude: results[index]['latitude'],
                longitude: results[index]['longitude'],
              );
            },
          )
        : coordinates = [];
    return coordinates;
  }
}
