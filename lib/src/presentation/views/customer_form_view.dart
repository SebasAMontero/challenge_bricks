import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:flutter/material.dart';

class CustomerFormView extends StatelessWidget {
  const CustomerFormView({Key? key}) : super(key: key);
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
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'City'),
              items: ['City 1', 'City 2', 'City 3']
                  .map((city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // TODO(SAM): Add event
              onPressed: () {
                context.router.push(const HomeRoute());
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
