import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addInterest({
    required String name,
    required String contact,
    required String message,
  }) async {
    try {
      await _db.collection('interests').add({
        'name': name,
        'contact': contact,
        'message': message,
        'createdAt': FieldValue.serverTimestamp(),
        'handled': false, // För framtida adminhantering
      });
    } catch (e) {
      print('Error adding interest: $e');
      rethrow;
    }
  }
}
