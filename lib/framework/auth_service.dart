import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  SupabaseClient supabase = Supabase.instance.client;

  Future<void> logout() {
    log('Logout user', name: 'DBService');
    return supabase.auth.signOut();
  }

}