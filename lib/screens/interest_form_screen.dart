import 'package:flutter/material.dart';
import '../models/interest_booking.dart';
import '../services/interest_booking_service.dart';
import 'interest_confirmation_screen.dart';

class InterestFormScreen extends StatefulWidget {
  const InterestFormScreen({super.key});

  @override
  State<InterestFormScreen> createState() => _InterestFormScreenState();
}

class _InterestFormScreenState extends State<InterestFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newBooking = InterestBooking(
        phoneNumber: _phoneController.text.trim(),
        message: _messageController.text.trim(),
      );

      InterestBookingService.addBooking(newBooking);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const InterestConfirmationScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boka rådgivning')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Telefonnummer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ange ett telefonnummer';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Beskriv ditt ärende',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Skriv ett meddelande';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Skicka'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
