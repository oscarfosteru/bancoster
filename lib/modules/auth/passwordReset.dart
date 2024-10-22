import 'package:flutter/material.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.PNG',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'correo electrónico'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verify_code');
              },
              child: const Text('Enviar código'),
            ),
          ],
        ),
      ),
    );
  }
}
