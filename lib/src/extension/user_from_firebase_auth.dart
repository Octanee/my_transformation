import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:my_transformation/src/models/models.dart';

extension UserFromFirebaseAuth on firebase_auth.User {
  User get toUser => User(
        id: uid,
        email: email,
        name: displayName,
      );
}
