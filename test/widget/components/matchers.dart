import 'package:flutter/material.dart';

bool textByMessageMatcher(Widget widget, String message) {
  if (widget is Text) {
    return widget.data == message;
  }
  return false;
}
