import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:realsocial/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/auth_provider.dart';

class AuthController {
  final SupabaseClient supabase;

  AuthController(this.supabase);

  // Future signInWithGoogle() async {
  //   try {
  //     final res = await supabase.auth.signInWithOAuth(
  //       OAuthProvider.google,
  //       // redirectTo: 'https://example.com/auth/callback',

  //       redirectTo:
  //           'com.example.realsocial://auth/callback', // iOS/Android deep link
  //     );
  //     Constants.loggerd("Google Sign-In Success: $res");
  //     return true;
  //   } catch (error) {
  //     Constants.loggerd("Error signing in: $error");
  //   }
  // }

  final GoogleSignIn _googleSignIn =
      GoogleSignIn(serverClientId: dotenv.env['SEVERCID']!);

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User canceled

      // Get the authenticated user's information
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      Constants.loggerd(googleAuth.idToken);

      // Sign in to Supabase with the Google ID token
      final res = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
      );

      Constants.loggerd('User signed in: ${res.user?.email}');

      if (res.session != null) {
        return true;
      }
    } catch (e) {
      Constants.loggerd('Error signing in: $e');
    }
  }

  Future<void> signOut() async {
    // Sign out from supabase
    await supabase.auth.signOut();
  }
}

final authControllerProvider = Provider<AuthController>((ref) {
  final supabase = ref.watch(authProvider);
  return AuthController(supabase);
});
