import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/model/filter_home.dart';

import '../mock/mock_superhero_webclient.dart';
import '../mock/superheroes_mock.dart';

main() {
  group("SuperheroesListFetchEvent", () {
    var e = Exception("Error");

    blocTest(
      "should emit fetching and fetched states",
      build: () {
        final webClient = MockSuperheroWebClient();
        when(webClient.getAll())
            .thenAnswer((_) async => mockSuperHeroesListBloc);
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(SuperheroesListFetchEvent()),
      expect: () => [
        SuperheroesListFetchingState(),
        SuperheroesListFetchedState(superheroes: mockSuperHeroesListBloc)
      ],
    );
    blocTest(
      "should emit fetching and error state",
      build: () {
        final webClient = MockSuperheroWebClient();
        when(webClient.getAll()).thenThrow(e);
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(SuperheroesListFetchEvent()),
      expect: () => [
        SuperheroesListFetchingState(),
        SuperheroesListErrorState(exception: e)
      ],
    );
  });
  group("SuperheroesFilterEvent", () {
    blocTest(
      "should emit filtering and filter state with filtered by female",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(isFemaleSelected: true, isMaleSelected: false),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(
            superheroesFiltered: mockSuperHeroesListBloc.sublist(0, 3))
      ],
    );

    blocTest(
      "should emit filtering and filter state with filtered by male",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(isFemaleSelected: false, isMaleSelected: true),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(
            superheroesFiltered: mockSuperHeroesListBloc.sublist(3))
      ],
    );

    blocTest(
      "should emit filtering and filter state with filtered by captain",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(search: "captain"),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(
            superheroesFiltered: mockSuperHeroesListBloc.sublist(2, 4))
      ],
    );

    blocTest(
      "should emit filtering and filter state with list filtered by male and captain",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(
                search: "captain",
                isFemaleSelected: false,
                isMaleSelected: true),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(
            superheroesFiltered: mockSuperHeroesListBloc.sublist(3, 4))
      ],
    );

    blocTest(
      "should emit filtering and filter state with list filtered by female and captain",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(
                search: "captain",
                isFemaleSelected: true,
                isMaleSelected: false),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(
            superheroesFiltered: mockSuperHeroesListBloc.sublist(2, 3))
      ],
    );

    blocTest(
      "should emit filtering and filter state with list empty",
      build: () {
        final webClient = MockSuperheroWebClient();
        return SuperheroesListBloc(webClient: webClient);
      },
      act: (bloc) => bloc.add(
        SuperheroesFilterEvent(
            filter: FilterHome(search: "none"),
            superheroes: mockSuperHeroesListBloc),
      ),
      expect: () => [
        SuperheroesListFilteringState(),
        SuperheroesListFilteredState(superheroesFiltered: [])
      ],
    );
  });
}
