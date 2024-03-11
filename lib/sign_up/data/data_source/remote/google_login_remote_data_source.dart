import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleLoginRemoteDataSource {
  late String _token;

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

    _token = googleToken.credential!.accessToken.toString();

    if (_token != 'null') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    return false;
  }

  Future<String> getToken() async {
    try {
      return _token;
    } catch (err) {
      return err.toString();
    }
  }
}
