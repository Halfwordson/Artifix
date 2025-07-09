import 'package:flutter/material.dart';
import 'screens/add_booking_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/history_screen.dart';
import 'screens/upcoming_bookings_screen.dart';
import 'screens/guest_home_screen.dart';
import 'screens/interest_list_screen.dart'; // ✅ lägg till

void main() {
  runApp(const ArtifixApp());
}

class ArtifixApp extends StatelessWidget {
  const ArtifixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artifix',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hem')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingScreen(),
                    ),
                  );
                },
                child: const Text('Boka tid'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
                child: const Text('Historik'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddBookingScreen(),
                    ),
                  );
                },
                child: const Text('Lägg till bokning'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpcomingBookingsScreen(),
                    ),
                  );
                },
                child: const Text('Kommande bokningar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GuestHomeScreen(),
                    ),
                  );
                },
                child: const Text('Gästläge'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InterestListScreen(),
                    ),
                  );
                },
                child: const Text('Intresseanmälningar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
