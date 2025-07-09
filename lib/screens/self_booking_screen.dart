import 'package:flutter/material.dart';

class SelfBookingScreen extends StatefulWidget {
  const SelfBookingScreen({super.key});

  @override
  State<SelfBookingScreen> createState() => _SelfBookingScreenState();
}

class _SelfBookingScreenState extends State<SelfBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDateTime;

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate() || _selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fyll i alla fält!')),
      );
      return;
    }

    // Mock: spara bokningen (senare kopplas till backend!)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tack! Vi kontaktar dig snarast.')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boka tid själv')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _pickDateTime,
                child: const Text('Välj datum och tid'),
              ),
              const SizedBox(height: 8),
              if (_selectedDateTime != null)
                Text(
                  'Valt: ${_selectedDateTime!.toLocal()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Beskriv ditt ärende',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Obligatoriskt' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Skicka'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
