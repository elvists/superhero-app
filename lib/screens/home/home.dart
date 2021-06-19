import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_bloc.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_event.dart';
import 'package:superhero/bloc/superheroes_list/superheroes_list_state.dart';
import 'package:superhero/components/error_screen.dart';
import 'package:superhero/core/app_colors.dart';
import 'package:superhero/core/app_styles.dart';
import 'package:superhero/model/filter_home.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/routes.dart';

import 'components/icon_button_genre.dart';
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
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  List<Superhero> _superheroes;
  List<Superhero> _superheroesFiltered;
  FilterHome _filter = FilterHome();

  @override
  void initState() {
    _loadSuperheroes();
    super.initState();
  }

  void _loadSuperheroes() =>
      context.read<SuperheroesListBloc>().add(SuperheroesListFetchEvent());

  void _updateText(String search) {
    _filter.search = search;
    _filterSuperheroes();
  }

  void _updateFilterFemale() {
    _filter.isFemaleSelected = !_filter.isFemaleSelected;
    _filterSuperheroes();
  }

  void _updateFilterMale() {
    _filter.isMaleSelected = !_filter.isMaleSelected;
    _filterSuperheroes();
  }

  void _filterSuperheroes() => context.read<SuperheroesListBloc>().add(
        SuperheroesFilterEvent(
          superheroes: _superheroes,
          filter: _filter,
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
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

  FloatingActionButton _buildFloatActionButton() => FloatingActionButton(
        onPressed: _onPressFloatActionButton,
        child: const Icon(Icons.shuffle),
        backgroundColor: Colors.black,
      );

  void _onPressFloatActionButton() {
    if (_superheroes.isNotEmpty) {
      Superhero randomSuperhero =
          _superheroes[Random().nextInt(_superheroes.length)];
      _goToDetailsScreen(randomSuperhero.id);
    }
  }

  Column _buildScreen() => Column(
        children: [
          _buildFilter(),
          _buildListSuperheroes(),
        ],
      );

  Expanded _buildListSuperheroes() => Expanded(
        child: ListView.builder(
          itemCount: _superheroesFiltered.length,
          itemExtent: 150,
          itemBuilder: (context, index) {
            return ItemList(
              superhero: _superheroesFiltered[index],
              navigationToDetailFunction: _goToDetailsScreen,
            );
          },
        ),
      );

  Container _buildFilter() => Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                _buildSearchInput(),
                _buildGenreFilter(),
              ],
            ),
          ),
        ),
      );

  Row _buildGenreFilter() => Row(
        children: [
          IconButtonGenre(
            onPressed: _updateFilterFemale,
            icon: Icons.female,
            color: AppColors.pink,
            isSelected: _filter.isFemaleSelected,
          ),
          IconButtonGenre(
            onPressed: _updateFilterMale,
            icon: Icons.male,
            color: AppColors.blue,
            isSelected: _filter.isMaleSelected,
          ),
        ],
      );

  Expanded _buildSearchInput() => Expanded(
        child: TextFormField(
          cursorColor: AppColors.blue,
          maxLines: 1,
          onChanged: (String text) => _updateText(text),
          decoration: AppStyles.inputDecoration(
            AppLocalizations.of(context).searchHint,
          ),
        ),
      );

  void _goToDetailsScreen(int id) =>
      Navigator.pushNamed(context, DetailRoute, arguments: id);
}
