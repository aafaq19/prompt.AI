import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      // Trigger the Google Authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      // Obtain the auth details from the Google user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Use the credential to sign in with Firebase
      await _auth.signInWithCredential(credential);

      // Sign-in successful
      print("User signed in with Google!");
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset('assets/image/G.png'), // Google icon path
      ),
      onPressed: _signInWithGoogle, // Call Google Sign-In function
    );
  }
}
