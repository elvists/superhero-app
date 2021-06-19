import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/model/work.dart';
import 'package:superhero/screens/detail/components/expansion_tile_detail.dart';

import 'label_value_widget.dart';

class WorkDetail extends StatelessWidget {
  final Work work;
  const WorkDetail({
    Key key,
    @required this.work,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileDetail(
      child: _buildContent(context),
      title: AppLocalizations.of(context).workTitle,
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        LabelValue(
          label: AppLocalizations.of(context).baseLabel,
          value: work.base,
        ),
        LabelValue(
          label: AppLocalizations.of(context).occupationLabel,
          value: work.occupation,
        ),
      ]),
    );
  }
}
