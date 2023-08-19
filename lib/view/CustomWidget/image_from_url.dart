import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:acc_movies/view/CustomWidget/gem_plex_loading.dart';

class ImageFromUrl extends StatelessWidget {
  String forUrl;
   ImageFromUrl({
   required this.forUrl
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: forUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => GemPlexPlaceHolder(),
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        child: Icon(Icons.error)),
    );
  }
}