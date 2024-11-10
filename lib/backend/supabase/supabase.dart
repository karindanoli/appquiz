import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import '/flutter_flow/flutter_flow_util.dart';

export 'database/database.dart';

String _kSupabaseUrl = 'https://suoljqkuwkeuzcemzhlz.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1b2xqcWt1d2tldXpjZW16aGx6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4NTk2NzgsImV4cCI6MjA0MzQzNTY3OH0.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1b2xqcWt1d2tldXpjZW16aGx6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4NTk2NzgsImV4cCI6MjA0MzQzNTY3OH0.CkwF2JWWJvQaLGrUOHwauA9GbfQBH0j7pHlG_bT6LGA';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
