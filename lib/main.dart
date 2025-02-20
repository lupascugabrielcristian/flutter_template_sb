import 'package:flutter/material.dart';
import 'package:licitatii_mobil/route_generator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xiqbetuesoskwbcdemzh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhpcWJldHVlc29za3diY2RlbXpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk5MDI5OTYsImV4cCI6MjA1NTQ3ODk5Nn0.MInAD1ybIfqO4wS0B82GCOOxIeeSs8XSUgNeUxzoIVs',
  );
  
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}