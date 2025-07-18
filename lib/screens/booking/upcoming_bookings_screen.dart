import 'package:flutter/material.dart';
import 'package:artifix_app/models/booking.dart';
import 'package:artifix_app/services/booking_service.dart';
import 'package:artifix_app/components/booking_card.dart';

class UpcomingBookingsScreen extends StatelessWidget {
  const UpcomingBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingService = BookingService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kommande bokningar'),
      ),
      body: FutureBuilder<List<Booking>>(
        future: bookingService.getBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Inga bokningar.'));
          }

          final bookings = snapshot.data!
              .where((booking) => booking.date.isAfter(DateTime.now()))
              .toList();

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return BookingCard(booking: bookings[index]);
            },
          );
        },
      ),
    );
  }
}
