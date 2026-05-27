import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> init() async {
    await dotenv.load(fileName: '.env');

    await Supabase.initialize(
      url: dotenv.env['MY_CLASSES_URL']!,
      anonKey: dotenv.env['MY_CLASSES_ANON_KEY']!,
    );
  }
}
