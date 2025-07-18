import 'package:flutter/material.dart';
import '../../models/interest.dart';
import '../../services/interest_service.dart';

class InterestFormScreen extends StatefulWidget {
  const InterestFormScreen({super.key});

  @override
  State<InterestFormScreen> createState() => _InterestFormScreenState();
}

class _InterestFormScreenState extends State<InterestFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final InterestService _service = InterestService();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newInterest = Interest(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        handled: false,
      );

      _service.add(newInterest);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Intresseanmälan skickad!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skicka intresse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Namn'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ange ditt namn' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefonnummer'),
                validator: (value) =>
                    value == null || value.length < 8 ? 'Ogiltigt nummer' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Skicka intresse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
