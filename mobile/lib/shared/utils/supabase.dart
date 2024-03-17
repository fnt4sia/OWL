import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static String url = 'https://gkrzpruurzsarotxqmbc.supabase.co';
  static String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrcnpwcnV1cnpzYXJvdHhxbWJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA2NDc0MzksImV4cCI6MjAyNjIyMzQzOX0.1CraZT9GYqWHMAUwE_KTfLIZF3cnvYh_-PiPfrPtfIw';

  static final supabase = Supabase.instance.client;
}
