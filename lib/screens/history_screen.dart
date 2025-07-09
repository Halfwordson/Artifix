import 'package:flutter/material.dart';
import '../services/booking_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allBookings = BookingService().bookings;
    final pastBookings = allBookings
        .where((booking) => booking.dateTime.isBefore(DateTime.now()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historik'),
      ),
      body: ListView.builder(
        itemCount: pastBookings.length,
        itemBuilder: (context, index) {
          final booking = pastBookings[index];
          return ListTile(
            title: Text(booking.name),
            subtitle: Text(
              '${booking.service} – ${booking.dateTime.toLocal().toString().split(".")[0]}',
            ),
            leading: const Icon(Icons.history),
          );
        },
      ),
    );
  }
}
