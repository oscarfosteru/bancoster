import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenida a Bancoster'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/home_image.PNG',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenida a Bancoster, es home.dart',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
