import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/model/appearance.dart';
import 'package:superhero/screens/detail/components/expansion_tile_detail.dart';

import 'expansion_tile_content.dart';
import 'label_value_widget.dart';

class AppearanceDetail extends StatelessWidget {
  final Appearance appearance;
  const AppearanceDetail({
    Key key,
    @required this.appearance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTileDetail(
        content: ExpansionTileContent(children: _buildContent(context)),
        title: AppLocalizations.of(context).appearanceTitle,
      );

  List<LabelValue> _buildContent(BuildContext context) => [
        LabelValue(
          label: AppLocalizations.of(context).genderLabel,
          value: appearance.gender,
        ),
        LabelValue(
          label: AppLocalizations.of(context).raceLabel,
          value: appearance.race,
        ),
        LabelValue(
          label: AppLocalizations.of(context).eyeColorLabel,
          value: appearance.eyeColor,
        ),
        LabelValue(
          label: AppLocalizations.of(context).hairColorLabel,
          value: appearance.hairColor,
        ),
        LabelValue(
          label: AppLocalizations.of(context).heightLabel,
          value: appearance.getHeight(),
        ),
        LabelValue(
          label: AppLocalizations.of(context).weightLabel,
          value: appearance.getWeight(),
        )
      ];
}
