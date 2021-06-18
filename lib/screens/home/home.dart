import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/common/components/error_screen.dart';
import 'package:superhero/model/superhero.dart';

import 'components/item_list.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SuperheroesListBloc(),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key key}) : super(key: key);

  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    _loadSuperheroes();
    super.initState();
  }

  void _loadSuperheroes() {
    context.read<SuperheroesListBloc>().add(SuperheroesListFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SuperheroesListBloc, SuperheroesListState>(
          builder: (context, state) {
            if (state is SuperheroesListErrorState) {
              return ErrorScreen(retry: _loadSuperheroes);
            }
            if (state is SuperheroesListFetchedState) {
              return _buildScreen(state.superheroes);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _buildScreen(List<Superhero> superheroes) {
    return ListView.builder(
      itemCount: superheroes.length,
      itemExtent: 150,
      itemBuilder: (context, index) {
        return ItemList(superhero: superheroes[index]);
      },
    );
  }
}
