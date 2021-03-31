import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomGoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User user = userCredential.user;

    if (user.isAnonymous)
      throw PlatformException(
          code: 'USER_NOT_FOUND', message: 'Anonymous Sign In');
    if (await user.getIdToken() == null)
      throw PlatformException(
          code: 'INVALID_ID_TOKEN', message: 'Invalid Id Token');

    final User currentUser = _auth.currentUser;

    if (currentUser.uid != user.uid)
      throw PlatformException(
          code: 'CANNOT_FIND_USER', message: 'Cannot find user');

    return user;
  }
}
