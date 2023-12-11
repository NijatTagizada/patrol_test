import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

void main() {
  patrolTest(
    'click navigate',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await $.pumpWidgetAndSettle(
        const ProviderScope(
          child: MainApp(),
        ),
      );

      await $(PatrolTestPage).waitUntilVisible();

      expect($('Hello World!'), findsOneWidget);

      expect($(#textkey), findsOneWidget);
    },
  );
}
