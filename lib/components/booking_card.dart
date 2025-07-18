import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/booking.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(booking.date);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(booking.name),
        subtitle: Text('${booking.description}\n$formattedDate'),
        isThreeLine: true,
      ),
    );
  }
}
