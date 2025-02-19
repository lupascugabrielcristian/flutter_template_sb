import 'package:licitatii_mobil/presentation/presentation.dart';

import '../usecase/create_trip.dart';

class MapPresentation extends Presentation {

  final CreateTrip _createTrip;

  MapPresentation(this._createTrip);

  Future<void> createTrip(String tripName) {
    return _createTrip.invoke(tripName);
  }
}