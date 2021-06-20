import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superhero/components/cache_network_image_with_progress.dart';
import 'package:superhero/model/appearance.dart';
import 'package:superhero/model/biography.dart';
import 'package:superhero/model/connections.dart';
import 'package:superhero/model/powerstats.dart';
import 'package:superhero/model/work.dart';

import 'common.dart';

void findHeaderDetail(String name) {
  findMessageText(name);
  findType(CacheNetworkImageWithProgress);
}

Future<void> findExpansionTileAndClick(WidgetTester tester, String name) async {
  var expansionTileTitle = find.text(name);
  expect(expansionTileTitle, findsOneWidget);
  await tester.tap(expansionTileTitle);
  await tester.pumpAndSettle();
}

void findAppearanceValues(Appearance appearance, {bool isVisible = true}) {
  findMessageText(appearance.eyeColor,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(appearance.gender,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(appearance.race,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(appearance.hairColor,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(appearance.getHeight(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(appearance.getWeight(),
      matcher: isVisible ? findsOneWidget : findsNothing);
}

void findBiographyValues(Biography biography, {bool isVisible = true}) {
  findMessageText(biography.alignment,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.alterEgos,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.firstAppearance,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.fullName,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.placeOfBirth,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.publisher,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(biography.getAliases(),
      matcher: isVisible ? findsOneWidget : findsNothing);
}

void findConnectionsValues(Connections connections, {bool isVisible = true}) {
  findMessageText(connections.relatives,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(connections.groupAffiliation,
      matcher: isVisible ? findsOneWidget : findsNothing);
}

void findWorkValues(Work work, {bool isVisible = true}) {
  findMessageText(work.base,
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(work.occupation,
      matcher: isVisible ? findsOneWidget : findsNothing);
}

void findPowerstatsValues(Powerstats powerstats, {bool isVisible = true}) {
  findMessageText(powerstats.combat.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(powerstats.durability.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(powerstats.power.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(powerstats.speed.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(powerstats.strength.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findMessageText(powerstats.intelligence.toString(),
      matcher: isVisible ? findsOneWidget : findsNothing);
  findType(RadarChart, matcher: isVisible ? findsOneWidget : findsNothing);
}
