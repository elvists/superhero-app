import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:superhero/model/superhero.dart';

abstract class SuperheroesListState extends Equatable {
  const SuperheroesListState();

  @override
  List<Object> get props => [];
}

class SuperheroesListEmptyState extends SuperheroesListState {
  const SuperheroesListEmptyState();
}

class SuperheroesListFetchingState extends SuperheroesListState {}

class SuperheroesListFetchedState extends SuperheroesListState {
  final List<Superhero> superheroes;

  const SuperheroesListFetchedState({@required this.superheroes});

  @override
  List<Object> get props => [this.superheroes];
}

class SuperheroesListFilteringState extends SuperheroesListState {}

class SuperheroesListFilteredState extends SuperheroesListState {
  final List<Superhero> superheroesFiltered;

  const SuperheroesListFilteredState({@required this.superheroesFiltered});

  @override
  List<Object> get props => [this.superheroesFiltered];
}

class SuperheroesListErrorState extends SuperheroesListState {
  final Exception exception;

  const SuperheroesListErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
