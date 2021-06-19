import 'package:flutter/material.dart';
import 'package:superhero/model/superhero.dart';
import 'package:superhero/screens/detail/components/appearance_detail.dart';
import 'package:superhero/screens/detail/components/connections_detail.dart';

import 'biography_detail.dart';
import 'powerstats_detail.dart';
import 'work_detail.dart';

class DetailPageBody extends StatelessWidget {
  final Superhero superhero;

  const DetailPageBody({Key key, this.superhero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          AppearanceDetail(appearance: superhero.appearance),
          BiographyDetail(biography: superhero.biography),
          WorkDetail(work: superhero.work),
          ConnectionsDetail(connections: superhero.connections),
          PowerstatsDetail(powerstats: superhero.powerstats)
        ],
      ),
    );
  }
}
