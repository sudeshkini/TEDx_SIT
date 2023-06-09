import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final double totalHeight;
  final double totalWidth;

  final double left;
  final double top;
  final double width;
  final double height;

  final String imageURL;

  MyNetworkImage({
    this.totalHeight = 100.0,
    this.totalWidth = 100.0,
    this.left = 0.0,
    this.top = 0.0,
    this.width = 100.0,
    this.height = 100.0,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: MyClipper(
        left: left,
        top: top,
        width: width,
        height: height,
      ),
      child: CachedNetworkImage(
        alignment: Alignment.center,
        // fit: BoxFit.cover,
        height: totalHeight,
        width: totalWidth,
        imageUrl: imageURL,
        placeholder: (context, url) {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double left;
  final double top;
  final double width;
  final double height;

  MyClipper({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      left,
      top,
      width,
      height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
