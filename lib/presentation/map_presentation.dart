import 'package:licitatii_mobil/presentation/presentation.dart';

import '../usecase/create_trip.dart';
import '../usecase/logout.dart';

class MapPresentation extends Presentation {

  final CreateTrip _createTrip;
  final Logout _logout;

  MapPresentation(this._createTrip, this._logout);

  Future<void> createTrip(String tripName) {
    return _createTrip.invoke(tripName);
  }

  Future<bool> logout() {
    return _logout.invoke();
  }
}