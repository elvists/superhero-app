import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/model/biography.dart';
import 'package:superhero/screens/detail/components/expansion_tile_detail.dart';

import 'expansion_tile_content.dart';
import 'label_value_widget.dart';

class BiographyDetail extends StatelessWidget {
  final Biography biography;
  const BiographyDetail({
    Key key,
    @required this.biography,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTileDetail(
        content: ExpansionTileContent(children: _buildContent(context)),
        title: AppLocalizations.of(context).biographyTitle,
      );

  List<LabelValue> _buildContent(BuildContext context) => [
        LabelValue(
          label: AppLocalizations.of(context).fullNameLabel,
          value: biography.fullName,
        ),
        LabelValue(
          label: AppLocalizations.of(context).alterEgosLabel,
          value: biography.alterEgos,
        ),
        LabelValue(
          label: AppLocalizations.of(context).placeOfBirthLabel,
          value: biography.placeOfBirth,
        ),
        LabelValue(
          label: AppLocalizations.of(context).publisherLabel,
          value: biography.publisher,
        ),
        LabelValue(
          label: AppLocalizations.of(context).alignmentLabel,
          value: biography.alignment,
        ),
        LabelValue(
          label: AppLocalizations.of(context).firstAppearanceLabel,
          value: biography.firstAppearance,
        ),
        LabelValue(
          label: AppLocalizations.of(context).aliasesLabel,
          value: biography.getAliases(),
        )
      ];
}
