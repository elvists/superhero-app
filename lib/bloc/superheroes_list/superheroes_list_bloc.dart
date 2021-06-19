import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/api/superhero_webclient.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';
import 'superheroes_list_event.dart';
import 'superheroes_list_state.dart';

class SuperheroesListBloc
    extends Bloc<SuperheroesListEvent, SuperheroesListState> {
  final SuperheroWebClient superheroWebClient;

  SuperheroesListBloc({SuperheroWebClient webClient})
      : superheroWebClient = webClient ?? SuperheroWebClient(),
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
      if (event is SuperheroesFilterEvent) {
        yield SuperheroesListFilteringState();
        List<Superhero> superheroesFiltered =
            _filter(event.superheroes, filter: event.filter);

        yield SuperheroesListFilteredState(
            superheroesFiltered: superheroesFiltered);
      }
    } catch (e) {
      yield SuperheroesListErrorState(exception: e);
    }
  }

  _filter(List<Superhero> superheroes, {FilterHome filter}) {
    return superheroes
        .where(
            (i) => i.name.toUpperCase().contains(filter.search?.toUpperCase()))
        .where((item) => _filterGenre(item, filter: filter))
        .toList();
  }

  _filterGenre(Superhero item, {FilterHome filter}) {
    return (filter.isMaleSelected && item.appearance.gender == "Male") ||
        (filter.isFemaleSelected && item.appearance.gender == "Female") ||
        ((filter.isAllGenresSelected || filter.isNoneGenresSelected) &&
            item.appearance.gender == "-");
  }
}
