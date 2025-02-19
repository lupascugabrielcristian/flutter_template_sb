import 'package:get_it/get_it.dart';
import 'package:licitatii_mobil/data/create_trip.dart';
import 'package:licitatii_mobil/data/mapper/trip_mapper.dart';
import 'package:licitatii_mobil/data/trips_data_source_remote.dart';
import 'package:licitatii_mobil/framework/db_service.dart';
import 'package:licitatii_mobil/framework/trips_remote_data_gateway.dart';
import 'package:licitatii_mobil/presentation/map_presentation.dart';
import 'package:licitatii_mobil/usecase/create_trip.dart';

final getIt = GetIt.instance;

void setupLocator(){
  getIt.registerSingleton<DBService>(DBService());

  // Mappers
  getIt.registerFactory<TripMapper>(() => TripMapper());

  // CREATE TRIP
  getIt.registerFactory<CreateTrip>(() => CreateTrip(getIt.get<CreateTripSource>()));
  getIt.registerFactory<CreateTripSource>(() => CreateTripCombined(getIt.get<CreateTripRemote>()));
  getIt.registerFactory<CreateTripRemote>(() => CreateTripRemote(getIt.get<TripsDataSourceRemote>(), getIt.get<TripMapper>()));
  getIt.registerFactory<TripsDataSourceRemote>(() => TripsRemoteDataGateway(getIt.get<DBService>()));

  // PRESENTATION
  getIt.registerFactory(() => MapPresentation(getIt.get<CreateTrip>()));
}
