import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback retry;
  const ErrorScreen({Key key, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context).errorMessage),
              ElevatedButton(
                child: Text(AppLocalizations.of(context).retryButtonLabel),
                onPressed: retry,
              ),
            ],
          ),
        ),
      );
}
