import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/booking.dart';
import '../../components/booking_card.dart';
import '../../services/booking_service.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Booking> bookings = BookingService.getGuestBookings();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Välkommen till Artifix'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Behöver du hjälp med något i hemmet? Se exempel på tidigare jobb nedan.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          for (var booking in bookings)
            BookingCard(booking: booking),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/interest-form');
            },
            child: const Text('Skicka intresse'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
            child: const Text('Logga in som användare'),
          ),
        ],
      ),
    );
  }
}
