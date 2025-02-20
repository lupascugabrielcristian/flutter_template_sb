import 'package:flutter/material.dart';
import 'package:licitatii_mobil/presentation/map_presentation.dart';

class MapScreen extends StatelessWidget  {
  const MapScreen({super.key, required this.presentation});

  final MapPresentation presentation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            presentation.createTrip('Trip name').then((res) {
              debugPrint('Trip created');
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('map'),
          ))
      ),);
  }

}