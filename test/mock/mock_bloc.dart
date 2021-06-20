import 'package:bloc_test/bloc_test.dart';
import 'package:superhero/bloc/superhero/superhero_bloc.dart';
import 'package:superhero/bloc/superhero/superhero_event.dart';
import 'package:superhero/bloc/superhero/superhero_state.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';

class MockSuperheroBloc extends MockBloc<SuperheroEvent, SuperheroState>
    implements SuperheroBloc {}

class MockSuperheroesListBloc
    extends MockBloc<SuperheroesListEvent, SuperheroesListState>
    implements SuperheroesListBloc {}
