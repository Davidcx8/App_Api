import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.build_circle, size: 80, color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Flutter Toolbox App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'A modular Flutter application centralizing various useful tools based on public APIs.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Version: 1.0.0',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
