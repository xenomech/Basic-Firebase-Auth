import 'package:firebase_auth/firebase_auth.dart';
import 'package:________________/Models/user.dart'; // fill in with your app name

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //private variable _auth

  // creating a user model based on firebase user
  User _fromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, name: user.displayName) : null;
  }

  // sign in with email and password
  Future signinwithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password

  Future registerwithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future Signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
