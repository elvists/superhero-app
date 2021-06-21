import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/api/superhero_webclient.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/service/superhero_service.dart';
import 'superheroes_list_event.dart';
import 'superheroes_list_state.dart';

class SuperheroesListBloc
    extends Bloc<SuperheroesListEvent, SuperheroesListState> {
  final SuperheroService superheroService;

  SuperheroesListBloc({SuperheroService service})
      : superheroService = service ?? SuperheroService(),
        super(const SuperheroesListEmptyState());

  @override
  Stream<SuperheroesListState> mapEventToState(
      SuperheroesListEvent event) async* {
    try {
      if (event is SuperheroesListFetchEvent) {
        yield SuperheroesListFetchingState();
        List<Superhero> superheroes = await superheroService.getAll();
        yield SuperheroesListFetchedState(superheroes: superheroes);
      }
      if (event is SuperheroesFilterEvent) {
        yield SuperheroesListFilteringState();
        List<Superhero> superheroesFiltered =
            superheroService.filter(event.superheroes, filter: event.filter);
        yield SuperheroesListFilteredState(
            superheroesFiltered: superheroesFiltered);
      }
    } catch (e) {
      yield SuperheroesListErrorState(exception: e);
    }
  }
}
