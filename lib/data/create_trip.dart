import 'package:licitatii_mobil/data/mapper/trip_mapper.dart';
import 'package:licitatii_mobil/data/trips_data_source_remote.dart';
import 'package:licitatii_mobil/usecase/create_trip.dart';

import '../model/trip.dart';

class CreateTripCombined implements CreateTripSource {
  final CreateTripRemote remote;

  const CreateTripCombined(this.remote);

  @override
  Future<void> createTrip(String name) async {
    final trip = await remote.createTrip(name);
    // Do something based on result
  }
}

class CreateTripRemote {
  final TripsDataSourceRemote source;
  final TripMapper mapper;

  const CreateTripRemote(this.source, this.mapper);

  Future<Trip> createTrip(String name) async {
    Map<String, dynamic> data = await source.createTrip(name);
    return mapper.fromJson(data);
  }
}