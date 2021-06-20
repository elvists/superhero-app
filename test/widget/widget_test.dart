import 'package:flutter_test/flutter_test.dart';

import 'home_test.dart' as home_teste;
import 'detail_test.dart' as detail_test;

void main() {
  group("widget test => ", () {
    home_teste.main();
    detail_test.main();
  });
}
