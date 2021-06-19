import 'package:flutter/material.dart';
import 'package:superhero/core/app_text_styles.dart';

class ExpansionTileDetail extends StatelessWidget {
  final Widget child;
  final String title;
  const ExpansionTileDetail(
      {Key key, @required this.child, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: ExpansionTile(
          title: Text(
            title,
            style: AppTextStyles.textStyleExpansionTileTitle,
          ),
          expandedAlignment: Alignment.topLeft,
          children: [child],
        ),
      ),
    );
  }
}
