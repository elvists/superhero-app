import 'package:flutter/material.dart';
import 'package:superhero/common/components/cache_network_image_with_progress.dart';

class DetailPageHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  const DetailPageHeader({
    Key key,
    this.imageUrl,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _getExpandedHeight(context),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          background: CacheNetworkImageWithProgress(imageUrl: imageUrl)),
    );
  }

  _getExpandedHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.width * 1.333;
    double safePadding = MediaQuery.of(context).padding.top;
    return height - safePadding;
  }
}
