/// Reusable functions for authentication with Firebase like creating a new user,
/// signing in with Google, etc...
library;

import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Adds the user details to the database.
void addUserToDatabase(User user) async {}

/// Signs in a user using the Google API.
Future<bool> googleSignIn(BuildContext context) async {
  try {
    LoginProvider loginState = Provider.of<LoginProvider>(
      context,
      listen: false,
    );
    UserModel user = Provider.of<UserModel>(context, listen: false);

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential credentials = await FirebaseAuth.instance
        .signInWithCredential(credential);

    user.init(
      credentials.user!,
      credentials.user!.displayName ?? "",
      credentials.user!.email ?? "",
    );
    loginState.login(credentials.user!.emailVerified);

    return true;
  } catch (e) {
    return false;
  }
}
