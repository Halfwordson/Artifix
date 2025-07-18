import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBookingScreen extends StatelessWidget {
  const AddBookingScreen({super.key});

  void _addTestBooking() {
    FirebaseFirestore.instance.collection('bookings').add({
      'customerName': 'Testkund',
      'serviceType': 'Testservice',
      'date': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore-test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hej från Artifix!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTestBooking,
              child: const Text('Lägg till testdata'),
            ),
          ],
        ),
      ),
    );
  }
}
