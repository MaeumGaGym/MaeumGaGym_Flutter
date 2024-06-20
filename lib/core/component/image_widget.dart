import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { svg, svgNetwork, png, pngNetwork }

class ImageWidget extends StatelessWidget {
  final double? width, height, imageWidth, imageHeight, radiusCircular;
  final Color? backgroundColor, color;
  final String image;
  final ImageType imageType;

  const ImageWidget({
    super.key,
    // image path
    required this.image,
    // image type
    this.imageType = ImageType.png,
    // image color
    this.color,
    // image width
    this.imageWidth,
    // image height
    this.imageHeight,
    // container width
    this.width,
    // container height
    this.height,
    // container color
    this.backgroundColor,
    // container radius.circular
    this.radiusCircular,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radiusCircular ?? 0),
      ),
      child: Center(
        child: Builder(
          builder: (context) {
            switch (imageType) {
              case ImageType.png:
                return Image.asset(
                  image,
                  color: color,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                );
              case ImageType.pngNetwork:
                return CachedNetworkImage(
                  imageUrl: image,
                  color: color,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                );
              case ImageType.svg:
                return SvgPicture.asset(
                  image,
                  color: color,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                );
              case ImageType.svgNetwork:
                return SvgPicture.network(
                  image,
                  color: color,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                );
            }
          },
        ),
      ),
    );
  }
}
