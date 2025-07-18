import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTestPage extends StatelessWidget {
  const FirestoreTestPage({super.key});

  Future<void> _addTestData() async {
    await FirebaseFirestore.instance.collection('test').add({
      'timestamp': FieldValue.serverTimestamp(),
      'message': 'Hej från Artifix!',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore-test')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addTestData,
            child: const Text('Lägg till testdata'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('test')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();

                final docs = snapshot.data!.docs;
                return ListView(
                  children: docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['message'] ?? 'Inget meddelande'),
                      subtitle: Text(
                        (data['timestamp'] as Timestamp?)?.toDate().toString() ?? '',
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
