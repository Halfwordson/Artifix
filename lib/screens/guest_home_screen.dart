import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'interest_form_screen.dart';
import 'interest_list_screen.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gästläge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Välkommen till Artifix gästsida!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Boka rådgivning
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const InterestFormScreen()),
                );
              },
              child: const Text('Boka rådgivning'),
            ),
            const SizedBox(height: 10),

            // Visa testintresseanmälningar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const InterestListScreen()),
                );
              },
              child: const Text('🧪 Visa intresseanmälningar'),
            ),
            const SizedBox(height: 20),

            // Simulera betalning (mot lokal backend)
            ElevatedButton(
              onPressed: () async {
                try {
                  final response = await http.post(
                    Uri.parse('http://127.0.0.1:4242/create-payment-intent'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({
                      'amount': 1500,
                      'currency': 'sek',
                    }),
                  );

                  final msg = response.statusCode == 200
                      ? '✅ Betalning simulerad!'
                      : '❌ Betalning misslyckades';

                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Status'),
                        content: Text(msg),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  }
                } catch (e) {
                  debugPrint('⚠️ Fel vid betalning: $e');
                }
              },
              child: const Text('Simulera betalning'),
            ),
          ],
        ),
      ),
    );
  }
}
