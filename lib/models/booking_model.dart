import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  final String id;
  final String title;
  final String description;
  final String userId;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.createdAt,
  });

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Booking(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      userId: data['userId'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
