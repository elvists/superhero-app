import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superhero/bloc/superhero/superhero_bloc.dart';
import 'package:superhero/bloc/superhero/superhero_event.dart';
import 'package:superhero/bloc/superhero/superhero_state.dart';

import '../mock/mock_service.dart';
import '../mock/superheroes_mock.dart';

main() {
  group("superhero_bloc => ", () {
    group("SuperheroFetchEvent => ", () {
      var e = Exception("Error");

      blocTest(
        "should emit fetching and fetched states",
        build: () {
          final service = MockSuperheroService();
          when(service.getById(1)).thenAnswer((_) async => mockSuperHero);
          return SuperheroBloc(service: service);
        },
        act: (bloc) => bloc.add(SuperheroFetchEvent(id: 1)),
        expect: () => [
          SuperheroFetchingState(),
          SuperheroFetchedState(superhero: mockSuperHero),
        ],
      );
      blocTest(
        "should emit fetching and error state",
        build: () {
          final service = MockSuperheroService();
          when(service.getById(0)).thenThrow(e);
          return SuperheroBloc(service: service);
        },
        act: (bloc) => bloc.add(SuperheroFetchEvent(id: 0)),
        expect: () => [
          SuperheroFetchingState(),
          SuperheroErrorState(exception: e),
        ],
      );
    });
  });
}
