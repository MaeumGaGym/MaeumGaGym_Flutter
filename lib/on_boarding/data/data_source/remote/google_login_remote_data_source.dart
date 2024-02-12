import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleLoginRemoteDataSource {
  Future<bool> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential googleToken =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (googleToken.credential!.accessToken!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    await GoogleSignIn().signOut();

    return false;
  }

  Future<String> getToken() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential googleToken =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return googleToken.credential!.accessToken.toString();
  }
}
