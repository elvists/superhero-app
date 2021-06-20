import 'package:flutter_test/flutter_test.dart';

import 'superhero_bloc_test.dart' as superhero_bloc_test;
import 'superheroes_list_bloc_test.dart' as superheroes_list_bloc_test;

void main() {
  group("bloc test => ", () {
    superheroes_list_bloc_test.main();
    superhero_bloc_test.main();
  });
}
