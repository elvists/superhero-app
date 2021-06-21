import 'package:superhero/api/superhero_webclient.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';

class SuperheroService {
  final SuperheroWebClient superheroWebClient;

  SuperheroService({SuperheroWebClient webClient})
      : superheroWebClient = webClient ?? SuperheroWebClient();

  Future<List<Superhero>> getAll() async {
    var data = await superheroWebClient.getAll();
    return (data as List).map((s) => Superhero.fromJson(s)).toList();
  }

  Future<Superhero> getById(int id) async {
    var data = await superheroWebClient.getById(id);
    return Superhero.fromJson(data);
  }

  List<Superhero> filter(List<Superhero> superheroes, {FilterHome filter}) {
    return superheroes
        .where(
            (i) => i.name.toUpperCase().contains(filter.search?.toUpperCase()))
        .where((item) => filterGenre(item, filter: filter))
        .toList();
  }

  bool filterGenre(Superhero item, {FilterHome filter}) {
    return (filter.isMaleSelected && item.appearance.gender == "Male") ||
        (filter.isFemaleSelected && item.appearance.gender == "Female") ||
        ((filter.isAllGenresSelected || filter.isNoneGenresSelected) &&
            item.appearance.gender == "-");
  }
}
