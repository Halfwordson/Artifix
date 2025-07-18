import 'package:flutter/material.dart';
import 'package:artifix_app/models/interest_booking.dart';
import 'package:intl/intl.dart';

class InterestCard extends StatelessWidget {
  final InterestBooking interest;

  const InterestCard({super.key, required this.interest});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(interest.createdAt);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              interest.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(interest.email),
            const SizedBox(height: 8),
            Text(interest.message),
            const SizedBox(height: 12),
            Text(
              'Inskickad: $formattedDate',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
