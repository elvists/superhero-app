import 'package:flutter/material.dart';
import 'package:superhero/model/superhero.dart';

import 'item_list.dart';

class SuperheroesList extends StatelessWidget {
  final List<Superhero> superheroes;
  final Function(int id) navigationToDetailsFunction;

  const SuperheroesList({
    Key key,
    @required this.superheroes,
    @required this.navigationToDetailsFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: superheroes.length,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return ItemList(
            superhero: superheroes[index],
            navigationToDetailFunction: navigationToDetailsFunction,
          );
        },
      );
}
