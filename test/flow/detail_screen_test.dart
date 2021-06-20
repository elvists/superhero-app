import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:superhero/bloc/superhero/superhero_bloc.dart';
import 'package:superhero/bloc/superhero/superhero_event.dart';
import 'package:superhero/bloc/superhero/superhero_state.dart';
import 'package:superhero/screens/detail/detail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../actions/detail.dart';
import '../mock/mock_bloc.dart';
import '../mock/superheroes_mock.dart';
import '../actions/common.dart';
import '../widget/components/test_cache_manager.dart';

makeTestable(Bloc bloc) => MultiBlocProvider(
      providers: [
        BlocProvider<SuperheroBloc>.value(
          value: bloc,
        ),
      ],
      child: Provider<CacheManager>(
        create: (_) => TestCacheManager(),
        child: MaterialApp(
          home: Material(child: Scaffold(body: DetailScreen())),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

main() {
  group("superhero detail  => ", () {
    SuperheroBloc bloc;

    setUp(() {
      registerFallbackValue<SuperheroFetchedState>(
          SuperheroFetchedState(superhero: mockSuperHero));
      registerFallbackValue<SuperheroFetchEvent>(SuperheroFetchEvent(id: 1));
      bloc = MockSuperheroBloc();
    });

    testWidgets('should renders correctly', (WidgetTester tester) async {
      when(() => bloc.state)
          .thenAnswer((_) => SuperheroFetchedState(superhero: mockSuperHero));

      await tester.pumpWidget(makeTestable(bloc));

      await tester.pump();

      final gesture = await tester.startGesture(Offset(0, 380));
      findMessageText('Captain Marvel');
      findMessageText('Appearance', matcher: findsNothing);
      findMessageText('Work', matcher: findsNothing);
      findMessageText('Biography', matcher: findsNothing);
      findMessageText('Connections', matcher: findsNothing);
      findMessageText('Powerstats', matcher: findsNothing);

      await gesture.moveBy(Offset(0, -1000));
      await tester.pump();
      findMessageText('Appearance');
      findAppearanceValues(mockSuperHero.appearance, isVisible: false);

      findMessageText('Biography');
      findBiographyValues(mockSuperHero.biography, isVisible: false);

      findMessageText('Work');
      findWorkValues(mockSuperHero.work, isVisible: false);

      findMessageText('Connections');
      findConnectionsValues(mockSuperHero.connections, isVisible: false);

      findMessageText('Powerstats');
      findPowerstatsValues(mockSuperHero.powerstats, isVisible: false);
    });
  });
}
