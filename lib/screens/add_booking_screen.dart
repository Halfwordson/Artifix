import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../services/booking_service.dart';

class AddBookingScreen extends StatefulWidget {
  const AddBookingScreen({super.key});

  @override
  State<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends State<AddBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  DateTime? _selectedDateTime;

  Future<void> _pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final fullDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      _selectedDateTime = fullDateTime;
    });
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate() && _selectedDateTime != null) {
      final newBooking = Booking(
        name: _customerNameController.text,
        service: _serviceTypeController.text,
        dateTime: _selectedDateTime!,
      );
      BookingService().addBooking(newBooking);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bokningen har lagts till!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lägg till bokning')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _customerNameController,
                decoration: const InputDecoration(labelText: 'Kundnamn'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fyll i ett namn';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _serviceTypeController,
                decoration: const InputDecoration(labelText: 'Typ av tjänst'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fyll i en tjänst';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickDateTime,
                child: const Text('Välj datum och tid'),
              ),
              const SizedBox(height: 10),
              Text(
                _selectedDateTime == null
                    ? 'Inget datum valt'
                    : 'Valt datum: ${_selectedDateTime!.toLocal()}'.split(' ')[0],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitBooking,
                child: const Text('Lägg till bokning'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _serviceTypeController.dispose();
    super.dispose();
  }
}
