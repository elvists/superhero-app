import 'package:flutter/widgets.dart';
import 'package:superhero/routes.dart';
import 'package:superhero/screens/detail/detail.dart';

const String HomeRoute = "/home";
const String DetailRoute = "/superhero";

Route<dynamic> generateRouteTest(RouteSettings settings) {
  switch (settings.name) {
    case DetailRoute:
      return getPageRoute(DetailScreen(id: settings.arguments), settings);
  }
}
