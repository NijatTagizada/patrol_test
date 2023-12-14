import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

import 'test_base.dart';

main() {
  late TestBase testBase;

  patrolSetUp(() {
    testBase = TestBase();
  });

  patrolTest(
    'found hello world test',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await testBase.fillInput($);

      await $(PatrolTestPage).waitUntilVisible();

      await Future.delayed(const Duration(milliseconds: 1200));

      expect($(#textkey), findsOneWidget);

      await $.tap($(#textPress));

      expect($(#value).text, '44');

      expect($('Hello World!'), findsOneWidget);
    },
  );
}
