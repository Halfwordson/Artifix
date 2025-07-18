import 'package:artifix_app/models/interest_booking.dart';

class InterestBookingService {
  final List<InterestBooking> _interestBookings = [];

  Future<void> addInterestBooking(InterestBooking booking) async {
    // Här simulerar vi att datan sparas (t.ex. till en backend)
    await Future.delayed(const Duration(milliseconds: 500));
    _interestBookings.add(booking);
    print('Intresseanmälan sparad: ${booking.name}');
  }

  List<InterestBooking> getAllInterestBookings() {
    return _interestBookings;
  }
}
