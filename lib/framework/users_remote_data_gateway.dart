import 'package:licitatii_mobil/data/users_data_source_remote.dart';
import 'package:licitatii_mobil/framework/db_service.dart';

class UsersRemoteDataGateway implements UsersDataSourceRemote {
  final DBService dbService;

  const UsersRemoteDataGateway(this.dbService);

  @override
  Future<void> logout() {
    return dbService.logout();
  }

}