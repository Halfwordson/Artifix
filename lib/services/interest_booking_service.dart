import '../models/interest_booking.dart';

class InterestBookingService {
  static final List<InterestBooking> _interestBookings = [];

  static void addBooking(InterestBooking booking) {
    _interestBookings.add(booking);
  }

  static List<InterestBooking> getBookings() {
    return List.unmodifiable(_interestBookings);
  }
}
