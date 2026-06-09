import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class SupabaseConfig {
  static final url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: dotenv.get('SUPABASE_URL'),
  );

  static final publishableKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: dotenv.get('SUPABASE_ANON_KEY'),
  );
}
