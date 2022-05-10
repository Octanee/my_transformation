import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:my_transformation/src/cache/cache.dart';
import 'package:my_transformation/src/exception/exception.dart';
import 'package:my_transformation/src/models/models.dart';
import 'package:my_transformation/src/extension/extension.dart';

class AuthenticationRepository {
  final Cache _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    Cache? cache,
  })  : _cache = cache ?? Cache(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  static const userCacheKey = '___user_cache_key___';

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordException.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordException();
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordException.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordException();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogOutException.fromCode(e.code);
    } catch (_) {
      throw const LogOutException();
    }
  }
}
