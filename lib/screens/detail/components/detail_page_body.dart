import 'package:flutter/material.dart';
import 'package:superhero/common/components/label_value_widget.dart';
import 'package:superhero/model/appearance.dart';
import 'package:superhero/model/superhero.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/screens/detail/components/appearance.dart';

class DetailPageBody extends StatelessWidget {
  final Superhero superhero;

  const DetailPageBody({Key key, this.superhero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          AppearanceDetail(appearance: superhero.appearance),
        ],
      ),
    );
  }
}
