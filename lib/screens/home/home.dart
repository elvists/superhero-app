import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/common/components/error_screen.dart';
import 'package:superhero/core/app_colors.dart';
import 'package:superhero/core/app_styles.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/routes.dart';

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
  FilterHome filter = FilterHome();

  @override
  void initState() {
    _loadSuperheroes();
    super.initState();
  }

  void _loadSuperheroes() {
    context.read<SuperheroesListBloc>().add(SuperheroesListFetchEvent());
  }

  void _updateText(String search) {
    filter.search = search;
    _filterSuperheroes();
  }

  void _updateFilterFemale() {
    filter.isFemaleSelected = !filter.isFemaleSelected;
    _filterSuperheroes();
  }

  void _updateFilterMale() {
    filter.isMaleSelected = !filter.isMaleSelected;
    _filterSuperheroes();
  }

  void _filterSuperheroes() {
    context.read<SuperheroesListBloc>().add(SuperheroesFilterEvent(
          superheroes: _superheroes,
          filter: filter,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatActionButton(),
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

  FloatingActionButton _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: _onPressFloatActionButton,
      child: const Icon(Icons.shuffle),
      backgroundColor: Colors.black,
    );
  }

  void _onPressFloatActionButton() {
    Superhero randomSuperhero =
        _superheroes[Random().nextInt(_superheroes.length)];
    _goToDetailsScreen(randomSuperhero.id);
  }

  Column _buildScreen() {
    return Column(
      children: [
        _buildSearchInput(),
        _buildListSuperheroes(),
      ],
    );
  }

  Expanded _buildListSuperheroes() {
    return Expanded(
      child: ListView.builder(
        itemCount: _superheroesFiltered.length,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return ItemList(
              superhero: _superheroesFiltered[index],
              navigationToDetailFunction: _goToDetailsScreen);
        },
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: AppColors.blue,
                  maxLines: 1,
                  onChanged: (String text) => _updateText(text),
                  decoration: AppStyles.inputDecoration(
                      AppLocalizations.of(context).searchHint),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: new Icon(
                      Icons.female,
                      color: filter.isFemaleSelected
                          ? Colors.pink
                          : Colors.black12,
                    ),
                    onPressed: _updateFilterFemale,
                  ),
                  IconButton(
                    icon: new Icon(
                      Icons.male,
                      color:
                          filter.isMaleSelected ? Colors.blue : Colors.black12,
                    ),
                    onPressed: _updateFilterMale,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToDetailsScreen(int id) {
    Navigator.pushNamed(context, DetailRoute, arguments: id);
  }
}
