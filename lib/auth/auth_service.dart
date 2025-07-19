import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// 👈 fixad importväg
import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? currentUser;

  Future<bool> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = result.user?.uid;
      if (uid == null) return false;

      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (!doc.exists) return false;

      final data = doc.data()!;
      currentUser = UserModel(
        id: uid,
        email: email,
        role: data['role'] ?? 'guest',
      );
      return true;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  void logout() {
    _auth.signOut();
    currentUser = null;
  }
}
