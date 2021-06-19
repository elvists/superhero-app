import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superhero/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: generateRoute,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      theme: ThemeData(primaryColor: Colors.black),
      home: HomeContainer(),
    );
  }
}
