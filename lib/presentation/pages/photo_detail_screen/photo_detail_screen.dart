import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/presentation/pages/photo_detail_screen/photo_detail_layout.dart';

@RoutePage()
class PhotoDetailScreen extends StatelessWidget {
  const PhotoDetailScreen({super.key, required this.photo});

  final Photo photo;

  static const nameRoute = '/PhotoDetailScreen';

  @override
  Widget build(BuildContext context) {
    return PhotoDetailLayout(
      photo: photo,
    );
  }
}
