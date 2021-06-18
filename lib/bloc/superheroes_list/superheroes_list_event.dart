import 'package:equatable/equatable.dart';

abstract class SuperheroesListEvent extends Equatable {
  const SuperheroesListEvent();

  @override
  List<Object> get props => [];
}

class SuperheroesListFetchEvent extends SuperheroesListEvent {
  const SuperheroesListFetchEvent();
}
