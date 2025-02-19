import 'package:flutter/material.dart';
import 'package:licitatii_mobil/presentation/map_presentation.dart';

class MapScreen extends StatelessWidget  {
  const MapScreen({super.key, required this.presentation});

  final MapPresentation presentation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('map')
      ),);
  }

}