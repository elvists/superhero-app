import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/common/components/error_screen.dart';
import 'package:superhero/core/app_colors.dart';
import 'package:superhero/core/app_styles.dart';
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
  List<Superhero> _superheroes;
  List<Superhero> _superheroesFiltered;

  @override
  void initState() {
    _loadSuperheroes();
    super.initState();
  }

  void _loadSuperheroes() {
    context.read<SuperheroesListBloc>().add(SuperheroesListFetchEvent());
  }

  void _filterSuperheroes(String text) {
    context.read<SuperheroesListBloc>().add(SuperheroesFilterEvent(
          superheroes: _superheroes,
          filter: text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SuperheroesListBloc, SuperheroesListState>(
          listener: (context, state) {
            if (state is SuperheroesListFetchedState) {
              _superheroes = _superheroesFiltered = state.superheroes;
            }
            if (state is SuperheroesListFilteredState) {
              _superheroesFiltered = state.superheroesFiltered;
            }
          },
          builder: (context, state) {
            if (state is SuperheroesListErrorState) {
              return ErrorScreen(retry: _loadSuperheroes);
            }

            if (state is SuperheroesListFetchedState ||
                state is SuperheroesListFilteredState) {
              return _buildScreen();
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _buildScreen() {
    return Column(
      children: [
        _buildSearchInput(),
        _buildListSuperheroes(),
      ],
    );
  }

  _buildListSuperheroes() {
    return Expanded(
      child: ListView.builder(
        itemCount: _superheroesFiltered.length,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return ItemList(superhero: _superheroesFiltered[index]);
        },
      ),
    );
  }

  _buildSearchInput() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(children: [
            Expanded(
                child: TextFormField(
              cursorColor: AppColors.blue,
              maxLines: 1,
              onChanged: (String text) => _filterSuperheroes(text),
              decoration: AppStyles.inputDecoration(
                  AppLocalizations.of(context).searchHint),
            )),
          ]),
        ),
      ),
    );
  }
}
