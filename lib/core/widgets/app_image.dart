import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/shared_preferences/my_shared_keys.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.borderRadius,
    this.fit,  this.height,
  });

  final String imageUrl;
  final double width;
  final double? height;
  final BorderRadius borderRadius;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child:Image.network(
            imageUrl,
            fit: BoxFit.fill,
            width: width,
            height: height,
    ));
  }
}
