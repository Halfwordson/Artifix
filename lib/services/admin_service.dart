// lib/services/admin_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Skapar en ny admin-användare och lägger till den i Firestore med rollen 'admin'
  Future<void> createAdminUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Skapa användaren i Firebase Auth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? newUser = result.user;

      if (newUser == null) throw Exception("Kunde inte skapa användare.");

      // Spara i Firestore
      await _firestore.collection('users').doc(newUser.uid).set({
        'uid': newUser.uid,
        'email': email,
        'name': name,
        'role': 'admin',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      throw Exception('Fel vid skapande: ${e.message}');
    } catch (e) {
      throw Exception('Ett oväntat fel inträffade: $e');
    }
  }
}
