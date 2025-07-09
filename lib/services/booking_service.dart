import '../models/booking.dart';

class BookingService {
  static final BookingService _instance = BookingService._internal();

  factory BookingService() => _instance;

  BookingService._internal() {
    _bookings.addAll([
      Booking(
        name: 'Anders Rör',
        service: 'VVS',
        dateTime: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Booking(
        name: 'Elsas EL',
        service: 'EL',
        dateTime: DateTime.now().add(const Duration(days: 1)),
      ),
    ]);
  }

  final List<Booking> _bookings = [];

  List<Booking> get bookings => List.unmodifiable(_bookings);

  void addBooking(Booking booking) {
    _bookings.add(booking);
  }

  void removeBooking(Booking booking) {
    _bookings.remove(booking);
  }
}
