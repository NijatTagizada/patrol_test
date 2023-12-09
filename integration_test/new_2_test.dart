import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

void main() {
  patrolTest(
    'click navigate',
    ($) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(const MainApp());

      await $(PatrolTestPage).waitUntilExists();

      await $(Text).tap();

      await $(FirstPage).waitUntilExists();

      expect($(TextButton), findsOneWidget);
    },
  );
}
