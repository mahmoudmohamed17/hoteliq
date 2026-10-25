import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseAuthService {
  final SupabaseClient client;
  final GoogleSignIn googleSignIn;

  new(this.client, this.googleSignIn);

  User? getCurrentUser() => client.auth.currentUser;

  Future<User?> signInWithEmail(String email, String password) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response.user;
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
    );

    return response.user;
  }

  Future<User?> signInWithGoogle() async {
    final googleUser = await googleSignIn.authenticate();
    final idToken = googleUser.authentication.idToken;

    if (idToken == null) throw Exception('Failed to get ID token from Google');

    final response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
    );

    return response.user;
  }

  Future<void> resetPasswordForEmail(String email) async {
    await client.auth.resetPasswordForEmail(email);
  }

  Future<void> updatePassword(String newPassword) async {
    await client.auth.updateUser(UserAttributes(password: newPassword));
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await client.auth.signOut();
  }
}
