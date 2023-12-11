extension MapExtension on Map<String, dynamic> {
  void removeNullValues() {
    removeWhere((key, value) => value == null);
  }
}