import 'package:flutter/material.dart';
import 'package:artifix_app/services/booking_service.dart';
import 'package:artifix_app/models/booking_model.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  final BookingService _bookingService = BookingService();

  late Future<List<Booking>> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _bookingsFuture = _bookingService.getBookingsForCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mina bokningar'),
      ),
      body: FutureBuilder<List<Booking>>(
        future: _bookingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Fel: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Inga bokningar hittades.'));
          }

          final bookings = snapshot.data!;

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return ListTile(
                title: Text(booking.title),
                subtitle: Text(booking.description),
                trailing: Text(
                  booking.createdAt.toDate().toLocal().toString().split('.')[0],
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
