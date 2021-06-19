import 'package:flutter/widgets.dart';
import 'package:superhero/screens/detail/detail.dart';
import 'package:superhero/screens/home/home.dart';

const String HomeRoute = "/home";
const String DetailRoute = "/hero";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DetailRoute:
      return _getPageRoute(DetailContainer(id: settings.arguments), settings);
    default:
      return _getPageRoute(HomeContainer(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
