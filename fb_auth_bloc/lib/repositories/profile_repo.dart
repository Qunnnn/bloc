import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/models/user_model.dart';
import 'package:fb_auth_bloc/shared/constants/db_constants.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepo({required this.firebaseFirestore});

  Future<User> getUserProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get();

      if (userDoc.exists) {
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      }
      throw 'user not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        plugin: e.plugin,
        message: e.message ?? '',
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
