import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:my_transformation/src/cache/cache.dart';
import 'package:my_transformation/src/models/models.dart';

class DatabaseRepository {
  final String id;
  final Cache _cache;
  final firestore.FirebaseFirestore _firebaseFirestore;

  DatabaseRepository({
    required this.id,
    firestore.FirebaseFirestore? firebaseFirestore,
    Cache? cache,
  })  : _cache = cache ?? Cache(),
        _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  static const userDataCacheKey = '___user_data_cache_key___';
  static const userCollectionPath = 'user';

  Stream<UserData> get userData {
    return _firebaseFirestore
        .collection(userCollectionPath)
        .doc(id)
        .snapshots()
        .map((event) {
      final data = UserData.fromSnapshot(event);
      _cache.write(key: userDataCacheKey, value: data);
      return data;
    });
  }

  UserData get currentUserData {
    return _cache.read(key: userDataCacheKey) ?? UserData.empty;
  }

  Future<void> createUserData() async {
    return _firebaseFirestore
        .collection(userCollectionPath)
        .doc(id)
        .set(UserData.empty.toMap())
        .then((value) => print('New UserData ($id) document created.'));
  }

  Future<void> updateUserData({required UserData userData}) async {
    return _firebaseFirestore
        .collection(userCollectionPath)
        .doc(id)
        .update(userData.toMap())
        .then((value) => print('UserData ($id) document updated.'));
  }
}
