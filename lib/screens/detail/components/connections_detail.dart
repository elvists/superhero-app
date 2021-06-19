import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:superhero/model/connections.dart';
import 'package:superhero/screens/detail/components/expansion_tile_detail.dart';

import 'expansion_tile_content.dart';
import 'label_value_widget.dart';

class ConnectionsDetail extends StatelessWidget {
  final Connections connections;
  const ConnectionsDetail({
    Key key,
    @required this.connections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTileDetail(
        content: ExpansionTileContent(children: _buildContent(context)),
        title: AppLocalizations.of(context).connectionsTitle,
      );

  List<LabelValue> _buildContent(BuildContext context) => [
        LabelValue(
          label: AppLocalizations.of(context).groupAffiliationLabel,
          value: connections.groupAffiliation,
        ),
        LabelValue(
          label: AppLocalizations.of(context).relativesLabel,
          value: connections.relatives,
        ),
      ];
}
