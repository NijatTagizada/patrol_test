import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

void main() {
  patrolTest(
    'found hello world test',
    ($) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(const MainApp());

      expect($('Hello World!'), findsOneWidget);
    },
  );

  patrolTest(
    'found textkey test',
    (PatrolIntegrationTester $) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(const MainApp());

      expect($(#textkey), findsOneWidget);
    },
  );
}
