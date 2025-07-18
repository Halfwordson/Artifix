// lib/screens/admin/add_admin_screen.dart

import 'package:flutter/material.dart';
import 'package:artifix_app/services/admin_service.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _adminService = AdminService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      await _adminService.createAdminUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() {
        _successMessage = "Admin-användare skapad!";
      });

      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skapa admin')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (_successMessage != null)
              Text(_successMessage!, style: const TextStyle(color: Colors.green)),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Namn'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Fyll i namn' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-post'),
                    validator: (value) =>
                        value == null || !value.contains('@') ? 'Ogiltig e-post' : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Lösenord'),
                    obscureText: true,
                    validator: (value) =>
                        value != null && value.length < 6 ? 'Minst 6 tecken' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Skapa admin'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
