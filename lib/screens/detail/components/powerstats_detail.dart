import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:superhero/core/app_colors.dart';
import 'package:superhero/model/powerstats.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'expansion_tile_detail.dart';

class PowerstatsDetail extends StatelessWidget {
  final Powerstats powerstats;
  const PowerstatsDetail({Key key, this.powerstats}) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTileDetail(
        content: _buildContent(context),
        title: AppLocalizations.of(context).powerstatsTitle,
      );

  Column _buildContent(BuildContext context) => Column(
        children: [
          _buildRadarChart(context),
          _buildDetails(context),
        ],
      );

  Container _buildRadarChart(BuildContext context) {
    const ticks = [25, 50, 75, 100];
    return Container(
      height: MediaQuery.of(context).size.width * 0.90,
      child: RadarChart(
        ticks: ticks,
        features: powerstats.atributesList,
        data: [powerstats.dataList],
        sides: powerstats.atributesList.length,
        graphColors: [AppColors.blue],
      ),
    );
  }

  Container _buildDetails(BuildContext context) => Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItemColumn([
                _buildItem(
                    label: AppLocalizations.of(context).intelligenceLabel,
                    value: powerstats.intelligence),
                _buildItem(
                  label: AppLocalizations.of(context).strengthLabel,
                  value: powerstats.strength,
                ),
              ]),
              _buildItemColumn([
                _buildItem(
                  label: AppLocalizations.of(context).speedLabel,
                  value: powerstats.speed,
                ),
                _buildItem(
                  label: AppLocalizations.of(context).durabilityLabel,
                  value: powerstats.durability,
                ),
              ]),
              _buildItemColumn(
                [
                  _buildItem(
                      label: AppLocalizations.of(context).powerLabel,
                      value: powerstats.power),
                  _buildItem(
                    label: AppLocalizations.of(context).combatLabel,
                    value: powerstats.combat,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Column _buildItemColumn(List<Widget> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      );

  Row _buildItem({@required String label, @required int value}) => Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              value?.toString(),
              style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
}
