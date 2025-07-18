class Interest {
  final String name;
  final String phone;
  final bool handled;

  Interest({
    required this.name,
    required this.phone,
    required this.handled,
  });

  Interest copyWith({
    String? name,
    String? phone,
    bool? handled,
  }) {
    return Interest(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      handled: handled ?? this.handled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'handled': handled,
    };
  }

  factory Interest.fromMap(Map<String, dynamic> map) {
    return Interest(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      handled: map['handled'] ?? false,
    );
  }
}
