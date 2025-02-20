import 'package:licitatii_mobil/data/users_data_source_remote.dart';
import 'package:licitatii_mobil/usecase/logout.dart';

class LogoutCombined implements LogoutSource {
  final LogoutRemote remote;
  final LogoutLocal local;

  const LogoutCombined(this.remote, this.local);


  @override
  Future<bool> logout() async {
    final fromRemote = await remote.logout();
    if (fromRemote) {
      local.logout();
    }
    return fromRemote;
  }

}

class LogoutRemote {
  final UsersDataSourceRemote source;

  const LogoutRemote(this.source);

  Future<bool> logout() async {
    await source.logout();
    return true;
  }
}

class LogoutLocal {
  void logout() {

  }
}