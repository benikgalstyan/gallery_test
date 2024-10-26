import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_test/core/theme/text_styles.dart';
import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/presentation/tokens/spacing.dart';

class PhotoDetailLayout extends StatefulWidget {
  const PhotoDetailLayout({super.key, required this.photo});

  final Photo photo;

  @override
  State<PhotoDetailLayout> createState() => _PhotoDetailLayoutState();
}

const iconSize = 64.0;

class _PhotoDetailLayoutState extends State<PhotoDetailLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.photo.author)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.photo.url,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: iconSize,
                ),
              ),
              Spacings.spacer16,
              Padding(
                padding: Spacings.paddingH16,
                child: Text(
                  widget.photo.description,
                  textAlign: TextAlign.center,
                  style: TextStyles.secondaryTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
