import 'package:flutter/material.dart';
import 'package:artifix_app/components/booking_card.dart';
import 'package:artifix_app/models/booking.dart';
import 'package:artifix_app/services/booking_service.dart';

class AdminBookingsScreen extends StatelessWidget {
  const AdminBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingService = BookingService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin – Bokningar'),
      ),
      body: FutureBuilder<List<Booking>>(
        future: bookingService.getBookings(), // Mock-data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Inga bokningar tillgängliga.'));
          }

          final bookings = snapshot.data!;

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
