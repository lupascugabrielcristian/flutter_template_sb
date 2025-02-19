abstract interface class TripsDataSourceRemote {
  Future<Map<String, dynamic>> createTrip(String name);
}