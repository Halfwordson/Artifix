class Booking {
  final String name;
  final DateTime date;
  final String description;

  Booking({
    required this.name,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date.toIso8601String(),
      'description': description,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      name: map['name'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      description: map['description'] ?? '',
    );
  }
}
