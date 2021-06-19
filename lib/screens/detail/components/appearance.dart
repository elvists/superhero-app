import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/common/components/label_value_widget.dart';
import 'package:superhero/model/appearance.dart';

class AppearanceDetail extends StatelessWidget {
  final Appearance appearance;
  const AppearanceDetail({
    Key key,
    this.appearance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
        value: appearance.height.toString(),
      ),
      LabelValue(
        label: AppLocalizations.of(context).weightLabel,
        value: appearance.weight.toString(),
      ),
    ]);
  }
}
