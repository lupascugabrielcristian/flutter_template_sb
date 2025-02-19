import 'package:licitatii_mobil/data/trips_data_source_remote.dart';
import 'package:licitatii_mobil/framework/db_service.dart';

class TripsRemoteDataGateway implements TripsDataSourceRemote {

  final DBService dbService;

  const TripsRemoteDataGateway(this.dbService);

  @override
  Future<Map<String, dynamic>> createTrip(String name) {
    return dbService.createTrip(name);
  }

}