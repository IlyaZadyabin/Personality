import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personality/features/test/screens/test_screen.dart';
import 'package:personality/main.dart';

void onErrorIgnoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
        (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError) {
    if (kDebugMode) {
      print('Overflow error.');
    }
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App test', (WidgetTester tester) async {
    FlutterError.onError = onErrorIgnoreOverflowErrors;
    await tester.pumpWidget(App());

    expect(find.text("Let's get started"), findsOneWidget);
  });
}
