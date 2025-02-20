import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  SupabaseClient supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> createTrip(String name) {
    log('Creating trip', name: 'DBService');
    return Future.value({
      'id': 1,
      'name': name
    });
  }

  Future<void> logout() {
    log('Logout user', name: 'DBService');
    return supabase.auth.signOut();
  }

}