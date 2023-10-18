import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/services/storedatalocal_service.dart';
import 'package:todo_app/services/utils/auth_mode_enum.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _localStorage = locator<StoredatalocalService>();

  Future<String?> authenticate(
      String email, String password, AuthMode authMode) async {
    try {
      final UserCredential userCredential;
      if (authMode == AuthMode.login) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      final accessToken = await userCredential.credential?.accessToken;
      if (accessToken == null) return null;
      await _localStorage.setToken(accessToken);
      return accessToken;
    } on FirebaseAuthException {
      print('FIREBASE_ERROR: Firebase login fehlgeschlagen');
      return "Der Authentifizierungsprozess ist fehlgeschlagen.";
    } catch (error) {
      print('ERROR: login fehlgeschlagen $error');
      return "$error";
    }
  }
}
