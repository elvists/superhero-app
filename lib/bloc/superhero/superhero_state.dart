import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:superhero/model/superhero.dart';

abstract class SuperheroState extends Equatable {
  const SuperheroState();

  @override
  List<Object> get props => [];
}

class SuperheroEmptyState extends SuperheroState {
  const SuperheroEmptyState();
}

class SuperheroFetchingState extends SuperheroState {}

class SuperheroFetchedState extends SuperheroState {
  final Superhero superhero;

  const SuperheroFetchedState({@required this.superhero});

  @override
  List<Object> get props => [this.superhero];
}

class SuperheroErrorState extends SuperheroState {
  final Exception exception;

  const SuperheroErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
