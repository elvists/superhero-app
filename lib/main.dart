import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:superhero/app.dart';

void main() {
  runApp(
    Provider<CacheManager>(
      create: (_) => DefaultCacheManager(),
      child: App(),
    ),
  );
}
