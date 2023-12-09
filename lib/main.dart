import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PatrolTestPage(),
    );
  }
}

class PatrolTestPage extends StatelessWidget {
  const PatrolTestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FirstPage(),
              ),
            );
          },
          child: const Text(
            'Hello World!',
            key: Key('textkey'),
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: TextButton(
          onPressed: () {},
          child: const Text('text button new'),
        ),
      ),
    );
  }
}
