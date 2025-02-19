class CreateTrip {
  final CreateTripSource source;

  const CreateTrip(this.source);

  Future<void> invoke(String name) {
    return source.createTrip(name);
  }
}

abstract interface class CreateTripSource {
  Future<void> createTrip(String name);
}