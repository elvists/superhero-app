import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/service/superhero_service.dart';

import 'superhero_event.dart';
import 'superhero_state.dart';

class SuperheroBloc extends Bloc<SuperheroEvent, SuperheroState> {
  final SuperheroService superheroService;

  SuperheroBloc({SuperheroService service})
      : superheroService = service ?? SuperheroService(),
        super(const SuperheroEmptyState());

  @override
  Stream<SuperheroState> mapEventToState(SuperheroEvent event) async* {
    try {
      if (event is SuperheroFetchEvent) {
        yield SuperheroFetchingState();
        Superhero superhero = await superheroService.getById(event.id);
        yield SuperheroFetchedState(superhero: superhero);
      }
    } catch (e) {
      yield SuperheroErrorState(exception: e);
    }
  }
}
