import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:superhero/screens/detail/components/appearance_detail.dart';
import 'package:superhero/screens/detail/components/biography_detail.dart';
import 'package:superhero/screens/detail/components/connections_detail.dart';
import 'package:superhero/screens/detail/components/detail_page_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/screens/detail/components/powerstats_detail.dart';
import 'package:superhero/screens/detail/components/work_detail.dart';

import '../actions/detail.dart';
import '../mock/superheroes_mock.dart';
import 'components/test_cache_manager.dart';

Widget makeTestable(Widget widget) => Provider<CacheManager>(
      create: (_) => TestCacheManager(),
      child: MaterialApp(
        home: Material(child: widget),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

void main() {
  group(
    "detail_screen => ",
    () {
      testWidgets('should load superhero detail header with a name and image',
          (WidgetTester tester) async {
        await tester.pumpWidget(makeTestable(
          CustomScrollView(slivers: [
            DetailPageHeader(
              name: mockSuperHero.name,
              imageUrl: "",
            ),
          ]),
        ));
        findHeaderDetail(mockSuperHero.name);
      });

      testWidgets(
        'should load superhero detail appearance',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            makeTestable(
                AppearanceDetail(appearance: mockSuperHero.appearance)),
          );
          await tester.pump();

          findAppearanceValues(mockSuperHero.appearance, isVisible: false);
          await findExpansionTileAndClick(tester, "Appearance");
          findAppearanceValues(mockSuperHero.appearance);
        },
      );

      testWidgets(
        'should load superhero detail biography',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            makeTestable(BiographyDetail(biography: mockSuperHero.biography)),
          );
          await tester.pump();

          findBiographyValues(mockSuperHero.biography, isVisible: false);
          await findExpansionTileAndClick(tester, "Biography");
          findBiographyValues(mockSuperHero.biography);
        },
      );

      testWidgets(
        'should load superhero detail work',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            makeTestable(WorkDetail(work: mockSuperHero.work)),
          );
          await tester.pump();

          findWorkValues(mockSuperHero.work, isVisible: false);
          await findExpansionTileAndClick(tester, "Work");
          findWorkValues(mockSuperHero.work);
        },
      );

      testWidgets(
        'should load superhero detail connections',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            makeTestable(
                ConnectionsDetail(connections: mockSuperHero.connections)),
          );
          await tester.pump();

          findConnectionsValues(mockSuperHero.connections, isVisible: false);
          await findExpansionTileAndClick(tester, "Connections");
          findConnectionsValues(mockSuperHero.connections);
        },
      );

      testWidgets(
        'should load superhero detail powerstats',
        (WidgetTester tester) async {
          final TestWidgetsFlutterBinding binding =
              TestWidgetsFlutterBinding.ensureInitialized();
          await binding.setSurfaceSize(Size(1000, 1000));

          await tester.pumpWidget(
            makeTestable(
                PowerstatsDetail(powerstats: mockSuperHero.powerstats)),
          );
          await tester.pump();

          findPowerstatsValues(mockSuperHero.powerstats, isVisible: false);
          await findExpansionTileAndClick(tester, "Powerstats");
          findPowerstatsValues(mockSuperHero.powerstats);
        },
      );
    },
  );
}
