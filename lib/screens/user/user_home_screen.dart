import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Användarvy')),
      body: const Center(child: Text('Välkommen användare!')),
    );
  }
}
