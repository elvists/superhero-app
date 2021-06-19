import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/api/superhero_webclient.dart';
import 'package:superhero/model/superhero.dart';

import 'superhero_event.dart';
import 'superhero_state.dart';

class SuperheroBloc extends Bloc<SuperheroEvent, SuperheroState> {
  final SuperheroWebClient superheroWebClient;

  SuperheroBloc({SuperheroWebClient webClient})
      : superheroWebClient = webClient ?? SuperheroWebClient(),
        super(const SuperheroEmptyState());

  @override
  Stream<SuperheroState> mapEventToState(SuperheroEvent event) async* {
    try {
      if (event is SuperheroFetchEvent) {
        yield SuperheroFetchingState();
        Superhero superhero = await superheroWebClient.getById(event.id);
        yield SuperheroFetchedState(superhero: superhero);
      }
    } catch (e) {
      yield SuperheroErrorState(exception: e);
    }
  }
}
