import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

class CacheNetworkImageWithProgress extends StatelessWidget {
  final String imageUrl;
  const CacheNetworkImageWithProgress({Key key, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        cacheManager: Provider.of<CacheManager>(context),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
}
