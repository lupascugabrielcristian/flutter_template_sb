import 'package:licitatii_mobil/data/users_data_source_remote.dart';
import 'package:licitatii_mobil/framework/auth_service.dart';

class UsersRemoteDataGateway implements UsersDataSourceRemote {
  final AuthService authService;

  const UsersRemoteDataGateway(this.authService);

  @override
  Future<void> logout() {
    return authService.logout();
  }

}