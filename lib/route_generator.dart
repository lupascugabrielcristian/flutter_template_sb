import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:licitatii_mobil/screens/presentation/map_presentation.dart';
import 'package:licitatii_mobil/screens/login_screen.dart';
import 'package:licitatii_mobil/screens/map_screen.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/map':
        return MaterialPageRoute(builder: (_) => MapScreen(presentation: GetIt.I.get<MapPresentation>()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
        return MaterialPageRoute(builder: (_) => LoginScreen());
  }


}