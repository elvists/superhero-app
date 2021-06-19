import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/model/connections.dart';
import 'package:superhero/screens/detail/components/expansion_tile_detail.dart';

import 'label_value_widget.dart';

class ConnectionsDetail extends StatelessWidget {
  final Connections connections;
  const ConnectionsDetail({
    Key key,
    @required this.connections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileDetail(
      child: _buildContent(context),
      title: AppLocalizations.of(context).connectionsTitle,
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        LabelValue(
          label: AppLocalizations.of(context).groupAffiliationLabel,
          value: connections.groupAffiliation,
        ),
        LabelValue(
          label: AppLocalizations.of(context).relativesLabel,
          value: connections.relatives,
        ),
      ]),
    );
  }
}
