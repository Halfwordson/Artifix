import 'package:flutter/material.dart';
import '../models/interest_booking.dart';
import '../services/interest_booking_service.dart';

class InterestListScreen extends StatelessWidget {
  const InterestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InterestBooking> bookings = InterestBookingService.getBookings();

    return Scaffold(
      appBar: AppBar(title: const Text('Intresseanmälningar')),
      body: bookings.isEmpty
          ? const Center(child: Text('Inga anmälningar ännu.'))
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(booking.phoneNumber),
                  subtitle: Text(booking.message),
                );
              },
            ),
    );
  }
}
