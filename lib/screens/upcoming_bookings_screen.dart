import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../services/booking_service.dart' as booking_service;

class UpcomingBookingsScreen extends StatelessWidget {
  const UpcomingBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Booking> allBookings = booking_service.BookingService().bookings;
    List<Booking> futureBookings = allBookings
        .where((booking) => booking.dateTime.isAfter(DateTime.now()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kommande bokningar'),
      ),
      body: ListView.builder(
        itemCount: futureBookings.length,
        itemBuilder: (context, index) {
          final booking = futureBookings[index];
          return ListTile(
            title: Text(booking.name),
            subtitle: Text(
              '${booking.service} – ${booking.dateTime.toLocal().toString().split(".")[0]}',
            ),
            leading: const Icon(Icons.event_available),
          );
        },
      ),
    );
  }
}
