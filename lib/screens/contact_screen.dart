import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tack! Vi hör av oss snart.')),
      );

      // Här kan du lägga till kod för att spara eller skicka vidare meddelandet.
      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intresse / Kontakt')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Namn'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ange ditt namn' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-post'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value != null &&
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
                    ? 'Ange en giltig e-postadress'
                    : null,
              ),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Meddelande'),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty
                    ? 'Skriv ett meddelande'
                    : null,
              ),
              const SizedBox(height: 20),
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
