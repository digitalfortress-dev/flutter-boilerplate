import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarCirle extends StatelessWidget {
  const AvatarCirle({super.key, required this.linkAvatar, required this.size});
  final String linkAvatar;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10000.0),
      child: CachedNetworkImage(
        imageUrl: linkAvatar,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        height: size,
        width: size,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
