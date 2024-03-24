import '../../../../shared/utils/supabase.dart';

class Profile {
  static logout() async {
    await SupabaseManager.supabase.auth.signOut();
  }
}
