import 'package:get_it/get_it.dart';
import 'package:licitatii_mobil/data/create_trip.dart';
import 'package:licitatii_mobil/data/logout.dart';
import 'package:licitatii_mobil/data/mapper/trip_mapper.dart';
import 'package:licitatii_mobil/data/trips_data_source_remote.dart';
import 'package:licitatii_mobil/data/users_data_source_remote.dart';
import 'package:licitatii_mobil/framework/db_service.dart';
import 'package:licitatii_mobil/framework/trips_remote_data_gateway.dart';
import 'package:licitatii_mobil/framework/users_remote_data_gateway.dart';
import 'package:licitatii_mobil/presentation/map_presentation.dart';
import 'package:licitatii_mobil/usecase/create_trip.dart';
import 'package:licitatii_mobil/usecase/logout.dart';

final getIt = GetIt.instance;

void setupLocator(){
  getIt.registerSingleton<DBService>(DBService());

  // Mappers
  getIt.registerFactory<TripMapper>(() => TripMapper());

  // LOGOUT
  getIt.registerFactory<Logout>(() => Logout(getIt.get()));
  getIt.registerFactory<LogoutSource>(() => LogoutCombined(getIt.get<LogoutRemote>(), getIt.get())); // Nu trebuie sa pun tipul explicit daca este doar o singura varianta
  getIt.registerFactory<LogoutLocal>(() => LogoutLocal());
  getIt.registerFactory<LogoutRemote>(() => LogoutRemote(getIt.get<UsersDataSourceRemote>()));
  getIt.registerFactory<UsersDataSourceRemote>(() => UsersRemoteDataGateway(getIt.get<DBService>()));

  // CREATE TRIP
  getIt.registerFactory<CreateTrip>(() => CreateTrip(getIt.get<CreateTripSource>()));
  getIt.registerFactory<CreateTripSource>(() => CreateTripCombined(getIt.get<CreateTripRemote>()));
  getIt.registerFactory<CreateTripRemote>(() => CreateTripRemote(getIt.get<TripsDataSourceRemote>(), getIt.get<TripMapper>()));
  getIt.registerFactory<TripsDataSourceRemote>(() => TripsRemoteDataGateway(getIt.get<DBService>()));

  // PRESENTATION
  getIt.registerFactory(() => MapPresentation(getIt.get<CreateTrip>(), getIt.get()));
}
