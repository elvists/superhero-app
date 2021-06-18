import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class SuperheroEvent extends Equatable {
  const SuperheroEvent();

  @override
  List<Object> get props => [];
}

class SuperheroFetchEvent extends SuperheroEvent {
  final int id;

  const SuperheroFetchEvent({@required this.id});

  @override
  List<Object> get props => [id];
}
