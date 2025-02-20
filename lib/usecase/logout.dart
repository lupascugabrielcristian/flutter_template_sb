class Logout {
  final LogoutSource source;

  const Logout(this.source);

  Future<bool> invoke() {
    return source.logout();
  }
}

abstract interface class LogoutSource {
  Future<bool> logout();
}