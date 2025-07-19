import 'package:cloud_firestore/cloud_firestore.dart';

class InterestService {
  static Future<bool> submitInterest({
    required String name,
    required String email,
    required String description,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('interests').add({
        'name': name,
        'email': email,
        'description': description,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print('Error submitting interest: $e');
      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> fetchAllInterests() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('interests')
          .orderBy('timestamp', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data(),
              })
          .toList();
    } catch (e) {
      print('Error fetching interests: $e');
      return [];
    }
  }
}
