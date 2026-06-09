abstract class AppConstants {
  // SharedPrefs keys
  static const keyThemeDark = 'theme_dark';
  static const keyLocale = 'locale';
  static const keyUserId = 'user_id';
  static const keyUserData = 'user_data';
  static const keyCurrentSection = 'current_section';

  // Supabase table names
  static const tableUsers = 'Users';

  // Supabase storage buckets
  static const bucketAvatars = 'avatars';

  // Pagination
  static const pageSize = 20;

  // Attendance
  static const checkInWindowHours =
      2; // hours after midnight allowed to check in
}
