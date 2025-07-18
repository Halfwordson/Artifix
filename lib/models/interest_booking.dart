class InterestBooking {
  final String name;
  final String email;
  final String phone;
  final String message;
  final DateTime createdAt;

  InterestBooking({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  static InterestBooking fromMap(Map<String, dynamic> map) {
    return InterestBooking(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      message: map['message'] ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
