import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:superhero/components/cache_network_image_with_progress.dart';
import 'package:superhero/screens/home/components/item_list.dart';
import 'package:superhero/screens/home/components/list_superheroes.dart';

import '../mock/superheroes_mock.dart';
import 'components/test_cache_manager.dart';
import '../actions/common.dart';

Widget makeTestable(Widget widget) => Provider<CacheManager>(
      create: (_) => TestCacheManager(),
      child: MaterialApp(home: widget),
    );

void main() {
  group(
    "home_screen => ",
    () {
      testWidgets(
          'should load superhero item list with a name, genre, race and image',
          (WidgetTester tester) async {
        await tester
            .pumpWidget(makeTestable(ItemList(superhero: mockSuperHero)));

        findMessageText(mockSuperHero.appearance.race);
        findMessageText(mockSuperHero.appearance.gender);
        findMessageText(mockSuperHero.name);
        findType(CacheNetworkImageWithProgress);
      });

      testWidgets(
        'should load superhero list with mockSuperheroList length',
        (WidgetTester tester) async {
          await tester.pumpWidget(makeTestable(
            SuperheroesList(
              superheroes: mockSuperHeroesList,
              navigationToDetailsFunction: null,
            ),
          ));
          await tester.pump();

          expect(
              find.byType(ItemList), findsNWidgets(mockSuperHeroesList.length));
        },
      );
    },
  );
}
