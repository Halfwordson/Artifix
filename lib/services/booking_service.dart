import '../models/booking.dart';

class BookingService {
  // Används av AdminBookingsScreen (direkt statisk lista)
  static List<Booking> getGuestBookings() {
    return [
      Booking(
        name: 'Elfix AB',
        date: DateTime.now().add(const Duration(days: 1)),
        description: 'Videosamtal för felsökning av jordfelsbrytare.',
      ),
      Booking(
        name: 'Byggproffs i Skövde',
        date: DateTime.now().add(const Duration(days: 3)),
        description: 'Rådgivning om renovering av källare.',
      ),
    ];
  }

  // Används av BookingListScreen (via FutureBuilder)
  Future<List<Booking>> getBookings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Booking(
        name: 'Elfix AB',
        date: DateTime.now().add(const Duration(days: 2)),
        description: 'Felsökning via videosamtal.',
      ),
      Booking(
        name: 'Byggproffs',
        date: DateTime.now().add(const Duration(days: 5)),
        description: 'Rådgivning om badrumsrenovering.',
      ),
    ];
  }
}
