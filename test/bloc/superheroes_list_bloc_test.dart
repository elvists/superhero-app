import 'dart:developer';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/model/filter_home.dart';

import '../mock/mock_service.dart';
import '../mock/superheroes_mock.dart';

main() {
  group("superheroes_list_bloc => ", () {
    group("SuperheroesListFetchEvent => ", () {
      var e = Exception("Error");

      blocTest(
        "should emit fetching and fetched states",
        build: () {
          final service = MockSuperheroService();
          when(service.getAll())
              .thenAnswer((_) async => mockSuperHeroesLongerList);
          return SuperheroesListBloc(service: service);
        },
        act: (bloc) => bloc.add(SuperheroesListFetchEvent()),
        expect: () => [
          SuperheroesListFetchingState(),
          SuperheroesListFetchedState(superheroes: mockSuperHeroesLongerList)
        ],
      );
      blocTest(
        "should emit fetching and error state",
        build: () {
          final service = MockSuperheroService();
          when(service.getAll()).thenThrow(e);
          return SuperheroesListBloc(service: service);
        },
        act: (bloc) => bloc.add(SuperheroesListFetchEvent()),
        expect: () => [
          SuperheroesListFetchingState(),
          SuperheroesListErrorState(exception: e)
        ],
      );
    });
    group("SuperheroesFilterEvent => ", () {
      blocTest(
        "should emit filtering and filter state with filtered by female",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(isFemaleSelected: true, isMaleSelected: false),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(
              superheroesFiltered: mockSuperHeroesLongerList.sublist(0, 3))
        ],
      );

      blocTest(
        "should emit filtering and filter state with filtered by male",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(isFemaleSelected: false, isMaleSelected: true),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(
              superheroesFiltered: mockSuperHeroesLongerList.sublist(3))
        ],
      );

      blocTest(
        "should emit filtering and filter state with filtered by captain",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(search: "captain"),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(
              superheroesFiltered: mockSuperHeroesLongerList.sublist(2, 4))
        ],
      );

      blocTest(
        "should emit filtering and filter state with list filtered by male and captain",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(
                  search: "captain",
                  isFemaleSelected: false,
                  isMaleSelected: true),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(
              superheroesFiltered: mockSuperHeroesLongerList.sublist(3, 4))
        ],
      );

      blocTest(
        "should emit filtering and filter state with list filtered by female and captain",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(
                  search: "captain",
                  isFemaleSelected: true,
                  isMaleSelected: false),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(
              superheroesFiltered: mockSuperHeroesLongerList.sublist(2, 3))
        ],
      );

      blocTest(
        "should emit filtering and filter state with list empty",
        build: () {
          return SuperheroesListBloc();
        },
        act: (bloc) => bloc.add(
          SuperheroesFilterEvent(
              filter: FilterHome(search: "none"),
              superheroes: mockSuperHeroesLongerList),
        ),
        expect: () => [
          SuperheroesListFilteringState(),
          SuperheroesListFilteredState(superheroesFiltered: [])
        ],
      );
    });
  });
}
