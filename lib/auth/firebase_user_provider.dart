import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BetterLeaderFirebaseUser {
  BetterLeaderFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

BetterLeaderFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BetterLeaderFirebaseUser> betterLeaderFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BetterLeaderFirebaseUser>(
            (user) => currentUser = BetterLeaderFirebaseUser(user));
