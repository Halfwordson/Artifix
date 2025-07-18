// lib/screens/interest/interest_confirmation_screen.dart
import 'package:flutter/material.dart';

class InterestConfirmationScreen extends StatelessWidget {
  const InterestConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tack för din anmälan')),
      body: const Center(
        child: Text(
          'Vi har tagit emot din förfrågan.\nEn expert kontaktar dig inom kort.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
