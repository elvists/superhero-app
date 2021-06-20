import 'package:flutter_test/flutter_test.dart';

import '../widget/components/matchers.dart';

void findMessageText(String message, {Matcher matcher = findsOneWidget}) {
  final textFinder =
      find.byWidgetPredicate((widget) => textByMessageMatcher(widget, message));
  expect(textFinder, matcher);
}

void findType(Type type, {Matcher matcher = findsOneWidget}) {
  final textFinder = find.byType(type);
  expect(textFinder, matcher);
}
