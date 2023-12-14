import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart' as app;

class BaseTesting {
  Future<void> fillInput(PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(await app.mainTest());

    await $(#input).enterText('test message messagemessage message message');
  }
}
