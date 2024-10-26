import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_test/core/theme/text_styles.dart';
import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/presentation/tokens/spacing.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({
    super.key,
    required this.photos,
    required this.onPhotoTap,
  });

  final List<Photo> photos;
  final void Function(Photo photo) onPhotoTap;

  @override
  Widget build(BuildContext context) {
    const crossCount = 3;
    const aspectRatio = 0.8;
    const containerSize = 100.0;
    final borderRadius = BorderRadius.circular(8);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: aspectRatio,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GestureDetector(
          onTap: () => onPhotoTap(photo),
          child: Column(
            children: [
              Container(
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                ),
                child: CachedNetworkImage(
                  imageUrl: photo.thumbnailUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Spacings.spacer8,
              Text(
                photo.author,
                style: TextStyles.mainTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
