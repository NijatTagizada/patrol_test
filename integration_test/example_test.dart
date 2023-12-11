import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

main() {
  patrolTest(
    'found hello world test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await $.pumpWidgetAndSettle(
        ProviderScope(
          overrides: [stringProvider.overrideWithValue('1')],
          child: const MainApp(),
        ),
      );

      await $(PatrolTestPage).waitUntilVisible();

      await Future.delayed(const Duration(milliseconds: 1200));

      await $.tap($(#textPress));

      expect($(#value).text, '44');

      expect($('Hello World!'), findsOneWidget);
    },
  );
}
