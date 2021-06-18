import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/api/superhero_webclient.dart';
import 'package:superhero/model/superhero.dart';
import 'superheroes_list_event.dart';
import 'superheroes_list_state.dart';

class SuperheroesListBloc
    extends Bloc<SuperheroesListEvent, SuperheroesListState> {
  final SuperheroWebClient superheroWebClient;

  SuperheroesListBloc()
      : superheroWebClient = SuperheroWebClient(),
        super(const SuperheroesListEmptyState());

  @override
  Stream<SuperheroesListState> mapEventToState(
      SuperheroesListEvent event) async* {
    try {
      if (event is SuperheroesListFetchEvent) {
        yield SuperheroesListFetchingState();
        List<Superhero> superheroes = await superheroWebClient.getAll();
        yield SuperheroesListFetchedState(superheroes: superheroes);
      }
    } catch (e) {
      yield SuperheroesListErrorState(exception: e);
    }
  }
}
