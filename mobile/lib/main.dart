import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://gkrzpruurzsarotxqmbc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrcnpwcnV1cnpzYXJvdHhxbWJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA2NDc0MzksImV4cCI6MjAyNjIyMzQzOX0.1CraZT9GYqWHMAUwE_KTfLIZF3cnvYh_-PiPfrPtfIw',
  );
  runApp(const AppWidget());
}

final supabase = Supabase.instance.client;
