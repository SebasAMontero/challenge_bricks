import 'package:flutter/material.dart';

class CustomerDetailView extends StatelessWidget {
  final String clientName;
  final String clientEmail;
  final String clientCity;

  const CustomerDetailView({
    Key? key,
    required this.clientName,
    required this.clientEmail,
    required this.clientCity,
  }) : super(key: key);

// TODO(SAM):

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60.0,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Text(
                'Name: $clientName',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Text(
                'Email: $clientEmail',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Text(
                'City: $clientCity',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {}, // TODO(SAM): DELETE
              child: const Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
