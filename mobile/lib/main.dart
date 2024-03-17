import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app_widget.dart';
import 'shared/utils/supabase.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: SupabaseManager.url,
    anonKey: SupabaseManager.anonKey,
  );
  runApp(const AppWidget());
}
