import 'package:flutter/material.dart';
import '../../services/interest_service.dart';

class InterestListScreen extends StatefulWidget {
  const InterestListScreen({super.key});

  @override
  State<InterestListScreen> createState() => _InterestListScreenState();
}

class _InterestListScreenState extends State<InterestListScreen> {
  final InterestService _service = InterestService();

  @override
  Widget build(BuildContext context) {
    final interests = _service.getAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads'),
      ),
      body: ListView.builder(
        itemCount: interests.length,
        itemBuilder: (context, index) {
          final interest = interests[index];
          return Card(
            child: ListTile(
              title: Text(interest.name),
              subtitle: Text(interest.phone),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      setState(() {
                        _service.markAsHandled(index);
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _service.delete(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
