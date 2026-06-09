import 'package:supabase_flutter/supabase_flutter.dart';

/// Thin wrapper around the Supabase client.
/// Use this instead of calling Supabase.instance.client directly
/// so the rest of the app stays decoupled from the SDK.
class ApiService {
  SupabaseClient get client => Supabase.instance.client;

  // ── Auth helpers ──────────────────────────────────────────────
  Future<AuthResponse> signInWithEmail(String email, String password) =>
      client.auth.signInWithPassword(email: email, password: password);

  Future<AuthResponse> signUpWithEmail(
    String email,
    String password, {
    Map<String, dynamic>? data,
  }) => client.auth.signUp(email: email, password: password, data: data);

  Future<void> signOut() => client.auth.signOut();

  Session? get currentSession => client.auth.currentSession;
  User? get currentUser => client.auth.currentUser;

  // ── Database helpers ──────────────────────────────────────────
  SupabaseQueryBuilder from(String table) => client.from(table);

  // ── Storage helpers ───────────────────────────────────────────
  SupabaseStorageClient get storage => client.storage;

  // ── Realtime ─────────────────────────────────────────────────
  RealtimeChannel channel(String name) => client.channel(name);

  /// Invokes a Postgres function (RPC) hosted on Supabase.
  /// [fnName] is the name of the function in your database.
  /// [params] is an optional map of arguments to pass to the function.
  Future<dynamic> rpc(String fnName, {Map<String, dynamic>? params}) async {
    return await client.rpc(fnName, params: params);
  }
}
