import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:provider/provider.dart';
// import 'package:superhero/bloc/superhero/superhero_bloc.dart';
// import 'package:superhero/bloc/superhero/superhero_event.dart';
// import 'package:superhero/bloc/superhero/superhero_state.dart';
// import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
// import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
// import 'package:superhero/screens/detail/detail.dart';
// import 'package:superhero/screens/home/home.dart';

// import '../mock/mock_bloc.dart';
// import '../mock/superheroes_mock.dart';
// import '../actions/common.dart';
// import '../routes.dart';
// import '../widget/components/test_cache_manager.dart';

// makeTestable(Bloc bloc, {SuperheroBloc blocDetail}) => MultiBlocProvider(
//       providers: [
//         BlocProvider<SuperheroesListBloc>.value(
//           value: bloc,
//         ),
//         if (blocDetail != null)
//           BlocProvider<SuperheroBloc>.value(
//             value: blocDetail,
//           ),
//       ],
//       child: Provider<CacheManager>(
//         create: (_) => TestCacheManager(),
//         child: MaterialApp(
//           onGenerateRoute: generateRouteTest,
//           home: Material(child: Scaffold(body: HomeScreen())),
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: AppLocalizations.supportedLocales,
//         ),
//       ),
//     );

// main() {
//   group("superheroes list  => ", () {
//     SuperheroesListBloc blocList;
//     SuperheroBloc blocDetail;

//     setUp(() {
//       registerFallbackValue<SuperheroesListFetchedState>(
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList));
//       registerFallbackValue<SuperheroesListFetchEvent>(
//           SuperheroesListFetchEvent());

//       registerFallbackValue<SuperheroFetchedState>(
//           SuperheroFetchedState(superhero: mockSuperHero));
//       registerFallbackValue<SuperheroFetchEvent>(SuperheroFetchEvent(id: 1));
//       blocList = MockSuperheroesListBloc();
//       blocDetail = MockSuperheroBloc();
//     });

//     testWidgets('should renders correctly', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList));

//       await tester.pump();

//       mockSuperHeroesList.forEach((superhero) {
//         //find all heroes by name
//         findMessageText(superhero.name);
//       });
//     });

//     testWidgets('should filter B', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//           SuperheroesListFilteredState(
//               superheroesFiltered: mockSuperHeroesList.sublist(0, 1))
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList));
//       await tester.pump();

//       await tester.enterText(find.byType(TextFormField), 'B');
//       await tester.pump();

//       findMessageText("Batman");
//       findMessageText("Captain Marvel", matcher: findsNothing);
//       findMessageText("Superman", matcher: findsNothing);
//     });

//     testWidgets('should filter male', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//           SuperheroesListFilteredState(
//               superheroesFiltered: mockSuperHeroesList.sublist(0, 2))
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList));
//       await tester.pump();

//      // await tester.tap(find.byIcon(Icons.male));
//      // await tester.pump();

//     //  findMessageText("Batman");
//     //  findMessageText("Superman");
//     //  findMessageText("Captain Marvel", matcher: findsNothing);
//     });

//     testWidgets('should filter female', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//           SuperheroesListFilteredState(
//               superheroesFiltered: mockSuperHeroesList.sublist(2, 3))
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList));
//       await tester.pump();

//     //  await tester.tap(find.byIcon(Icons.male));
//     //  await tester.pump();

//     //  findMessageText("Batman", matcher: findsNothing);
//     //  findMessageText("Superman", matcher: findsNothing);
//     //  findMessageText("Captain Marvel");
//     });

//     testWidgets('should navigate', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );
//       whenListen(
//         blocDetail,
//         Stream.fromIterable([
//           SuperheroFetchedState(superhero: mockSuperHero),
//         ]),
//         initialState: SuperheroEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList, blocDetail: blocDetail));

//       await tester.pump();

//       var item = find.text("Batman");
//       await tester.tap(item);

//       await tester.pump();
//       await tester.pump();

//       var screen = find.byType(DetailScreen);
//       expect(screen, findsOneWidget);
//     });

//     testWidgets('should navigate random', (WidgetTester tester) async {
//       whenListen(
//         blocList,
//         Stream.fromIterable([
//           SuperheroesListFetchedState(superheroes: mockSuperHeroesList),
//         ]),
//         initialState: SuperheroesListEmptyState(),
//       );
//       whenListen(
//         blocDetail,
//         Stream.fromIterable([
//           SuperheroFetchedState(superhero: mockSuperHero),
//         ]),
//         initialState: SuperheroEmptyState(),
//       );

//       await tester.pumpWidget(makeTestable(blocList, blocDetail: blocDetail));

//       await tester.pump();

//       var fab = find.byType(FloatingActionButton);
//       await tester.tap(fab);

//       await tester.pump();
//       await tester.pump();

//       var screen = find.byType(DetailScreen);
//       expect(screen, findsOneWidget);
//     });
//   });
// }
