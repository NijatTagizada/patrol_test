import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart' as app;

class TestBase {
  Future<void> fillInput(PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(await app.mainTest());

    await $(#input).enterText('test message messagemessage message message');
  }
}
