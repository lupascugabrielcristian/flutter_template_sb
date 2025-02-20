import 'package:flutter/material.dart';
import 'package:licitatii_mobil/screens/presentation/map_presentation.dart';

class MapScreen extends StatelessWidget  {
  const MapScreen({super.key, required this.presentation});

  final MapPresentation presentation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Map screen'),

            ElevatedButton(
                onPressed: () {
                  presentation.createTrip('Trip name').then((res) {
                    debugPrint('Trip created');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Create trip'),
                )),

            ElevatedButton(
              onPressed: () {
                presentation.logout().then((res) {
                  Navigator.pushNamed(context, '/login');
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Logout'),
              )),
          ],
        )
      ),);
  }

}