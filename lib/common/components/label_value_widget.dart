import 'package:flutter/material.dart';
import 'package:superhero/core/app_text_styles.dart';

class LabelValue extends StatelessWidget {
  final String label;
  final String value;
  const LabelValue({Key key, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label,
              style: AppTextStyles.textStyleLabel,
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                value ?? "",
                style: AppTextStyles.textStyleValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
