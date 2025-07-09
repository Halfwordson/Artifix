import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String _selectedService = 'Rörmokare';
  DateTime? _selectedDate;

  final List<String> _services = ['Rörmokare', 'Elektriker', 'Snickare'];

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      final booking = {
        'name': _nameController.text,
        'address': _addressController.text,
        'service': _selectedService,
        'date': _selectedDate!.toIso8601String(),
      };

      print('🔧 Bokning skapad: $booking');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bokning sparad!')),
      );

      // Här kan vi senare lägga till sparning i lokal databas eller Firebase
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 60)),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boka tid')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Namn'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Fyll i namn' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedService,
                decoration: const InputDecoration(labelText: 'Tjänst'),
                items: _services
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() {
                  _selectedService = val!;
                }),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Adress (frivilligt)'),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Ingen dag vald'
                      : 'Datum: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                ),
                trailing: ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text('Välj datum'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Boka'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
