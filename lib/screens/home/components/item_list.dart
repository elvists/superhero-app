import 'package:flutter/material.dart';
import 'package:superhero/core/app_text_styles.dart';
import 'package:superhero/model/superhero.dart';

class ItemList extends StatelessWidget {
  final Superhero superhero;
  const ItemList({Key key, this.superhero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(superhero.images.sm),
          _buildContent(),
        ],
      ),
    );
  }

  _buildContent() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              superhero.name,
              style: AppTextStyles.textStyleTitle,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  superhero.appearance.race,
                  style: AppTextStyles.textStyleInfo,
                ),
                Text(
                  superhero.appearance.gender,
                  style: AppTextStyles.textStyleInfo,
                ),
              ],
            ),
          ],
        ),
      );
}
