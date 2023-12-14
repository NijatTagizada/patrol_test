import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final integerProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final stringProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

Future<ProviderScope> mainTest() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  return ProviderScope(
    parent: container,
    overrides: [stringProvider.overrideWithValue('1')],
    child: const MainApp(),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [stringProvider.overrideWithValue('1')],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return const MaterialApp(
      home: PatrolTestPage(),
    );
  }
}

class PatrolTestPage extends ConsumerStatefulWidget {
  const PatrolTestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PatrolTestPageState();
}

class _PatrolTestPageState extends ConsumerState<PatrolTestPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 1100));
      if (mounted) {
        ref.read(integerProvider.notifier).state = 22;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              key: const Key('input'),
            ),
            const SizedBox(height: 20),
            TextButton(
              key: const Key('textkey'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(),
                  ),
                );
              },
              child: const Text('Hello World!'),
            ),
            TextButton(
              key: const Key('textPress'),
              onPressed: () {
                ref.read(integerProvider.notifier).state = 44;
              },
              child: const Text('Increase number'),
            ),
            Text(
              key: const Key('value'),
              ref.watch(integerProvider).toString(),
            ),
          ],
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
