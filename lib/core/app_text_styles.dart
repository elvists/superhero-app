import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const textStyleInfo = TextStyle(
    fontSize: 16,
    color: AppColors.gray,
    fontWeight: FontWeight.normal,
  );

  static const textStyleTitle = TextStyle(
    fontSize: 21,
    color: AppColors.darkGray,
    fontWeight: FontWeight.bold,
  );

  static const textStyleHint = TextStyle(
    fontSize: 16,
    color: AppColors.lightGray,
  );
}
