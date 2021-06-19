import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';

abstract class SuperheroesListEvent extends Equatable {
  const SuperheroesListEvent();

  @override
  List<Object> get props => [];
}

class SuperheroesListFetchEvent extends SuperheroesListEvent {
  const SuperheroesListFetchEvent();
}

class SuperheroesFilterEvent extends SuperheroesListEvent {
  final FilterHome filter;
  final List<Superhero> superheroes;

  const SuperheroesFilterEvent(
      {@required this.filter, @required this.superheroes});

  @override
  List<Object> get props => [filter, superheroes];
}
