import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:superhero/components/cache_network_image_with_progress.dart';
import 'package:superhero/screens/detail/components/appearance_detail.dart';
import 'package:superhero/screens/detail/components/biography_detail.dart';
import 'package:superhero/screens/detail/components/connections_detail.dart';
import 'package:superhero/screens/detail/components/detail_page_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/screens/detail/components/powerstats_detail.dart';
import 'package:superhero/screens/detail/components/work_detail.dart';

import '../mock/superheroes_mock.dart';
import 'components/test_cache_manager.dart';
import 'components/actions.dart';

Widget makeTestable(Widget widget) => Provider<CacheManager>(
      create: (_) => TestCacheManager(),
      child: MaterialApp(
        home: Material(child: widget),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

void main() {
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
    findMessageText(mockSuperHero.name);
    findType(CacheNetworkImageWithProgress);
  });

  testWidgets(
    'should load superhero detail appearance',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(AppearanceDetail(appearance: mockSuperHero.appearance)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Appearance");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.appearance.eyeColor, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.gender, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.race, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.hairColor,
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getHeight(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getWeight(),
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.appearance.eyeColor);
      findMessageText(mockSuperHero.appearance.gender);
      findMessageText(mockSuperHero.appearance.race);
      findMessageText(mockSuperHero.appearance.hairColor);
      findMessageText(mockSuperHero.appearance.getHeight());
      findMessageText(mockSuperHero.appearance.getWeight());
    },
  );

  testWidgets(
    'should load superhero detail appearance',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(AppearanceDetail(appearance: mockSuperHero.appearance)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Appearance");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.appearance.eyeColor, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.gender, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.race, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.hairColor,
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getHeight(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getWeight(),
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.appearance.eyeColor);
      findMessageText(mockSuperHero.appearance.gender);
      findMessageText(mockSuperHero.appearance.race);
      findMessageText(mockSuperHero.appearance.hairColor);
      findMessageText(mockSuperHero.appearance.getHeight());
      findMessageText(mockSuperHero.appearance.getWeight());
    },
  );

  testWidgets(
    'should load superhero detail appearance',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(AppearanceDetail(appearance: mockSuperHero.appearance)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Appearance");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.appearance.eyeColor, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.gender, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.race, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.hairColor,
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getHeight(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getWeight(),
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.appearance.eyeColor);
      findMessageText(mockSuperHero.appearance.gender);
      findMessageText(mockSuperHero.appearance.race);
      findMessageText(mockSuperHero.appearance.hairColor);
      findMessageText(mockSuperHero.appearance.getHeight());
      findMessageText(mockSuperHero.appearance.getWeight());
    },
  );

  testWidgets(
    'should load superhero detail appearance',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(AppearanceDetail(appearance: mockSuperHero.appearance)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Appearance");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.appearance.eyeColor, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.gender, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.race, matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.hairColor,
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getHeight(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.appearance.getWeight(),
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.appearance.eyeColor);
      findMessageText(mockSuperHero.appearance.gender);
      findMessageText(mockSuperHero.appearance.race);
      findMessageText(mockSuperHero.appearance.hairColor);
      findMessageText(mockSuperHero.appearance.getHeight());
      findMessageText(mockSuperHero.appearance.getWeight());
    },
  );

  testWidgets(
    'should load superhero detail biography',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(BiographyDetail(biography: mockSuperHero.biography)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Biography");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.biography.alignment, matcher: findsNothing);
      findMessageText(mockSuperHero.biography.alterEgos, matcher: findsNothing);
      findMessageText(mockSuperHero.biography.firstAppearance,
          matcher: findsNothing);
      findMessageText(mockSuperHero.biography.fullName, matcher: findsNothing);

      findMessageText(mockSuperHero.biography.placeOfBirth,
          matcher: findsNothing);
      findMessageText(mockSuperHero.biography.publisher, matcher: findsNothing);
      findMessageText(mockSuperHero.biography.getAliases(),
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();
      findMessageText(mockSuperHero.biography.alignment);
      findMessageText(mockSuperHero.biography.alterEgos);
      findMessageText(mockSuperHero.biography.firstAppearance);
      findMessageText(mockSuperHero.biography.fullName);
      findMessageText(mockSuperHero.biography.placeOfBirth);
      findMessageText(mockSuperHero.biography.publisher);
      findMessageText(mockSuperHero.biography.getAliases());
    },
  );

  testWidgets(
    'should load superhero detail work',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(WorkDetail(work: mockSuperHero.work)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Work");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.work.base, matcher: findsNothing);
      findMessageText(mockSuperHero.work.occupation, matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.work.base);
      findMessageText(mockSuperHero.work.occupation);
    },
  );

  testWidgets(
    'should load superhero detail connections',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(ConnectionsDetail(connections: mockSuperHero.connections)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Connections");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.connections.relatives,
          matcher: findsNothing);
      findMessageText(mockSuperHero.connections.groupAffiliation,
          matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.connections.relatives);
      findMessageText(mockSuperHero.connections.groupAffiliation);
    },
  );

  testWidgets(
    'should load superhero detail powerstats',
    (WidgetTester tester) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      await binding.setSurfaceSize(Size(1000, 1000));

      await tester.pumpWidget(
        makeTestable(PowerstatsDetail(powerstats: mockSuperHero.powerstats)),
      );
      await tester.pump();

      var expansionTileTitle = find.text("Powerstats");
      expect(expansionTileTitle, findsOneWidget);

      findMessageText(mockSuperHero.powerstats.combat.toString(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.powerstats.durability.toString(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.powerstats.power.toString(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.powerstats.speed.toString(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.powerstats.strength.toString(),
          matcher: findsNothing);
      findMessageText(mockSuperHero.powerstats.intelligence.toString(),
          matcher: findsNothing);
      findType(RadarChart, matcher: findsNothing);

      await tester.tap(expansionTileTitle);
      await tester.pumpAndSettle();

      findMessageText(mockSuperHero.powerstats.combat.toString());
      findMessageText(mockSuperHero.powerstats.durability.toString());
      findMessageText(mockSuperHero.powerstats.power.toString());
      findMessageText(mockSuperHero.powerstats.speed.toString());
      findMessageText(mockSuperHero.powerstats.strength.toString());
      findMessageText(mockSuperHero.powerstats.intelligence.toString());
      findType(RadarChart);
    },
  );
}
