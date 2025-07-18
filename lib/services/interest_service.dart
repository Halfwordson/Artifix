import '../models/interest.dart';

class InterestService {
  final List<Interest> _interests = [
    Interest(name: 'Anna Andersson', phone: '0701234567', handled: false),
    Interest(name: 'Björn Berg', phone: '0737654321', handled: true),
  ];

  List<Interest> getAll() {
    return List.unmodifiable(_interests);
  }

  void add(Interest interest) {
    _interests.add(interest);
  }

  void markAsHandled(int index) {
    if (index >= 0 && index < _interests.length) {
      _interests[index] = _interests[index].copyWith(handled: true);
    }
  }

  void delete(int index) {
    if (index >= 0 && index < _interests.length) {
      _interests.removeAt(index);
    }
  }
}
