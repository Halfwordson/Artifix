import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> workers = ['Anders Rör', 'Elsa El', 'Målarmästaren AB'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boka Tid'),
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];
          return ListTile(
            title: Text(worker),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Valde: $worker')),
              );
            },
          );
        },
      ),
    );
  }
}
