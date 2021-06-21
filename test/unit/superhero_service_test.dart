import 'package:flutter_test/flutter_test.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/service/superhero_service.dart';

import '../mock/superheroes_mock.dart';

void main() {
  test('Call filter with filter empty', () {
    final service = SuperheroService();
    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesList,
      filter: FilterHome(),
    );
    expect(superheroesFiltered, mockSuperHeroesList);
  });

  test('Call filter with filter male false', () {
    final service = SuperheroService();
    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(isMaleSelected: false),
    );
    expect(superheroesFiltered, mockSuperHeroesLongerList.sublist(0, 3));
  });

  test('Call filter with filter female false', () {
    final service = SuperheroService();
    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(isFemaleSelected: false),
    );
    expect(superheroesFiltered, mockSuperHeroesLongerList.sublist(3));
  });

  test('Call filter with filter female and male false', () {
    final service = SuperheroService();
    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(isFemaleSelected: false, isMaleSelected: false),
    );
    expect(superheroesFiltered, []);
  });

  test('Call filter with filter text', () {
    final service = SuperheroService();

    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(search: 'man'),
    );
    expect(superheroesFiltered.length, 4);

    superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(search: 'captain'),
    );
    expect(superheroesFiltered, mockSuperHeroesLongerList.sublist(2, 4));
  });

  test('Call filter with filter text without item', () {
    final service = SuperheroService();

    List<Superhero> superheroesFiltered = service.filter(
      mockSuperHeroesLongerList,
      filter: FilterHome(search: 'none'),
    );
    expect(superheroesFiltered, []);
  });

  test('Call filterGenre ', () {
    final service = SuperheroService();

    bool isValid = service.filterGenre(
      mockSuperHero,
      filter: FilterHome(isFemaleSelected: false),
    );
    expect(isValid, false);

    isValid = service.filterGenre(
      mockSuperHero,
      filter: FilterHome(isMaleSelected: true),
    );
    expect(isValid, true);

    isValid = service.filterGenre(
      mockSuperHero,
      filter: FilterHome(isMaleSelected: false, isFemaleSelected: false),
    );
    expect(isValid, false);

    isValid = service.filterGenre(
      mockSuperHero,
      filter: FilterHome(),
    );
    expect(isValid, true);
  });
}
